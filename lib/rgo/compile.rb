module Rgo
  class Compile
    attr_reader :functions, :function_to_module_map, :aliases,
                :classes

    def initialize(statements)
      @statements = statements
      @functions = { private: [], public: [] }
      @function_access_type = :public
      @current_module = nil
      @aliases = {}
      @classes = []
      @function_to_module_map = {}
      @class_to_module_map = {}
      @next_func_type = nil
      @local_variables = []
      @next_instance_variable_type = nil
      @current_class = nil
    end

    def compile
      compile_statements(@statements)
    end

    def compile_statements(statements, indent = 0)
      statements = Array(statements) unless statements.is_a? Array
      statements.flatten!

      out = []

      statements.each do |statement|
        out << send("compile_#{statement.type}", statement, indent)
      end

      pretty out, indent
    end

    def compile_module(node, indent)
      @current_module = node.name

      out = []
      out << "package #{node.name.downcase}"
      out << ""
      out << compile_statements(node.children, indent)
      out << ""

      pretty out, indent
    end

    def compile_interface(node, indent)
      @inside_interface = true
      out = []
      out << "type #{node.name.downcase} interface {"
      out << ""
      out << compile_statements(node.children, indent +1)
      out << "}"

      @inside_interface = false

      pretty out, indent
    end

    def compile_include(node, indent)
      # compile included module to get list of functions
      filepath = node.name.map(&:downcase).join("/")

      statements = Rgo::Parser.new.parse(File.read("std/" + filepath + ".rgo"))
      compile = Rgo::Compile.new(statements)
      compile.compile

      compile.functions[:public].each do |func|
        @function_to_module_map[func] = [filepath, func]
      end

      compile.aliases.each do |name, func|
        @function_to_module_map[name] = [filepath, func]
      end

      compile.classes.each do |name, func|
        @class_to_module_map[name] = filepath.split("/").last
      end

      "import \"#{filepath}\""
    end

    def pretty(lines, indent = 0)
      out = []

      lines.each do |line|
        next if line.nil?

        if line.empty?
          out << ""
        else
          out << ("  " * indent) + line
        end
      end

      out.join("\n")
    end


    def compile_integer(node, indent)
      node.name.to_s
    end

    def compile_func_call(node, indent)
      mod, func = @function_to_module_map[node.name]
      mod = mod.split("/").last unless mod.nil?

      out = ""

      if mod.nil?
        out << func
      else
        out << mod.downcase + "." + func.split("_").map(&:capitalize).join
      end

      out << "(" + compile_args(node.children) + ")"

      out
    end

    def compile_args(nodes)
      out = []

      nodes.each do |node|
        out << compile_expression(node, 0)
      end

      out.join(", ")
    end

    def compile_func_def(node, indent)
      @functions[@function_access_type] << node.name
      @function_to_module_map[node.name] = [nil, node.name]

      args = compile_func_def_args(node.children[0])
      return_type = @next_func_type.nil? ? "" : @next_func_type[:return].to_s + " "
      return_type = "" if return_type == "nil "


      method_receiver =
        if @current_class.nil?
          ""
        else
          "(s *#{@current_class.downcase}) "
        end

      out = []

      if @inside_interface
        out << "#{method_receiver}#{node.name}(#{args}) #{return_type.strip}"
      else
        out << "func #{method_receiver}#{node.name}(#{args}) #{return_type}{"
        out << compile_statements(node.children[1], indent + 1)
        out << "}"
      end

      @next_func_type = nil
      @local_variables = []


      pretty out, indent
    end

    def compile_func_def_args(nodes)
      return if nodes.nil? || nodes.empty?

      raise "@next_func_type is empty" if @next_func_type.nil?

      pp nodes

      out = []
      nodes.each_with_index do |node, i|
        type = @next_func_type[:args][i]

        pointer = false
        if type[0] == "*"
          pointer = true
          type = type[1..-1]
        end

        mod = @class_to_module_map[type].to_s
        mod = mod + "." unless mod.empty?

        out << node.name + " " + (pointer ? "*" : "" ) + mod + type
        @local_variables << node.name
      end

      out.join(", ")
    end

    def compile_comment(node, indent)
      if node.name.start_with?(" type (")
        @next_func_type = {
          args: node.name.split("(")[1].split(")")[0].split(",").map(&:strip),
          return: node.name.split("->")[1].strip
        }

        return
      elsif node.name.start_with?(" type ")
        @next_instance_variable_type = node.name.split("type")[1].strip

        return
      end
      "//#{node.name}"
    end

    def compile_assignment(node, indent)
      out = ""

      unless @local_variables.include?(node.name)
        out << "var "
        @local_variables << node.name
      end

      out << "#{node.name} = #{compile_expression(node.children.first, 0)}"

      out
    end

    def compile_constant_assignment(node, indent)
      "const #{node.name.downcase} = #{compile_expression(node.children.first, 0)}"
    end

    def compile_expression(node, indent)
      send("compile_#{node.type}", node, indent)
    end

    def compile_string(node, indent)
      "\"#{node.name}\""
    end

    def compile_variable(node, indent)
      node.name
    end

    def compile_constant(node, indent)
      node.name.downcase
    end

    def compile_boolean(node, indent)
      node.name.to_s
    end

    def compile_blank_line(node, indent)
      ""
    end

    def compile_plus(node, indent)
      compile_node(node.children[0]) + " + " + compile_node(node.children[1])
    end

    def compile_multiply(node, indent)
      compile_node(node.children[0]) + " * " + compile_node(node.children[1])
    end

    def compile_minus(node, indent)
      compile_node(node.children[0]) + " - " + compile_node(node.children[1])
    end

    def compile_divide(node, indent)
      compile_node(node.children[0]) + " / " + compile_node(node.children[1])
    end

    def compile_less(node, indent)
      compile_node(node.children[0]) + " < " + compile_node(node.children[1])
    end

    def compile_greater(node, indent)
      compile_node(node.children[0]) + " > " + compile_node(node.children[1])
    end

    def compile_equal(node, indent)
      compile_node(node.children[0]) + " == " + compile_node(node.children[1])
    end

    def compile_mod(node, indent)
      compile_node(node.children[0]) + " % " + compile_node(node.children[1])
    end

    def compile_node(node)
      send("compile_#{node.type}", node, 0)
    end

    def compile_if(node, indent)
      out = []
      out << "if " + compile_node(node.name) + " {"
      out << "  " + compile_node(node.children)
      out << "}"

      pretty out, indent
    end

    def compile_if_else(node, indent)
      out = []
      out << "if " + compile_node(node.name) + " {"
      out << "  " + compile_node(node.children[0])
      out << "} else {"
      out << "  " + compile_node(node.children[1])
      out << "}"

      pretty out, indent
    end

    def compile_alias(node, indent)
      @aliases[node.name] = node.children

      nil
    end

    def compile_return(node, indent)
      "return " + compile_expression(node.children, indent)
    end

    def compile_class(node, indent)
      @classes << node.name

      @current_class = node.name.downcase

      out = []

      out << "type #{node.name.downcase} struct {"
      out << compile_statements(node.children[0], indent + 1)
      out << "}"
      out << ""

      out << compile_statements(node.children[1], indent)

      @current_class = nil

      pretty out, indent
    end

    def compile_instance_variable_def(node, indent)
      raise "type missing for instance variable @#{node.name}" if @next_instance_variable_type.nil?

      out = node.name + " " + @next_instance_variable_type

      @next_instance_variable_type = nil

      pretty [out], indent
    end

    def compile_instance_variable_get(node, indent)
      "s." + node.name
    end

    def compile_class_method_call(node, indent)
      method_name = node.children[0]

      raise "method #{method_name} is not implemented" unless method_name == "new"

      args = node.children[1]

      out = ""
      out << node.name.downcase
      out << "{"

      out << args.map do |arg|
        arg[0].to_s + ": " + compile_expression(arg[1], 0)
      end.join(", ")

      out << "}"

      out
    end

    def compile_class_instance_method_call(node, indent)
      out = node.name
      out << "."
      out << node.children[0]

      out << "("
      out << ")"

      out
    end

    def compile_range(node, ident)
      out = []
      out << "for " + node.children[0].join(", ") + " := range " + node.name + " {"
      out << compile_statements(node.children[1], ident + 1)
      out << "}"

      pretty out, ident
    end
  end
end
