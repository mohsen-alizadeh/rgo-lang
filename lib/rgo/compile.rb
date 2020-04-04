module Rgo
  class Compile
    attr_reader :functions, :function_to_module_map, :aliases

    def initialize(statements)
      @statements = statements
      @functions = { private: [], public: [] }
      @function_access_type = :public
      @current_module = nil
      @aliases = {}
      @function_to_module_map = {}
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

    def compile_include(node, indent)
      # compile included module to get list of functions

      statements = Rgo::Parser.new.parse(File.read("std/" + node.name.downcase + ".rgo"))
      compile = Rgo::Compile.new(statements)
      compile.compile

      compile.functions[:public].each do |func|
        @function_to_module_map[func] = [node.name, func]
      end

      compile.aliases.each do |name, func|
        @function_to_module_map[name] = [node.name, func]
      end

      "import \"#{node.name.downcase}\""
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

      "#{mod.downcase}.#{func.capitalize}(" + compile_args(node.children) + ")"
    end

    def compile_args(nodes)
      out = []

      nodes.each do |node|
        case node.type
        when :string
          out << "\"#{node.name}\""
        when :variable
          out << node.name
        when :constant
          out << node.name.downcase
        else
          raise "unexpected argument type passed : #{node.type}"
        end
      end

      pretty out, 0
    end

    def compile_func_def(node, indent)
      # @functions[@current_module] = {}
      # @functions[@current_module][@function_access_type] ||= []
      # @functions[@current_module][@function_access_type] << node.name
      @functions[@function_access_type] << node.name

      out = []
      out << "func #{node.name}() {"
      out << compile_statements(node.children[1], indent + 1)
      out << "}"

      pretty out, indent
    end

    def compile_comment(node, indent)
      "//#{node.name}"
    end


    def compile_assignment(node, indent)
      "var #{node.name} = #{compile_expression(node.children.first, 0)}"
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
  end
end
