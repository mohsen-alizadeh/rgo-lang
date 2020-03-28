module Rgo
  class Compile
    attr_reader :functions, :function_to_module_map

    def initialize(statements)
      @statements = statements
      @functions = { private: [], public: [] }
      @function_access_type = :public
      @current_module = nil
      @function_to_module_map = {}
    end

    def compile
      compile_statements(@statements)
    end

    def compile_statements(statements, indent = 0)
      statements = Array(statements) unless statements.is_a? Array

      out = []

      statements.each do |statement|
        # puts "statement : #{statement.inspect}"
        out << send("compile_#{statement.type}", statement, indent)
      end

      pretty out, indent
    end

    def compile_module(node, indent)
      @current_module = node.name

      out = []
      out << "package #{node.name.downcase}"
      out << compile_statements(node.children, indent)

      pretty out, indent
    end

    def compile_include(node, indent)
      # compile included module to get list of functions

      statements = Rgo::Parser.new.parse(File.read("std/" + node.name.downcase + ".rgo"))
      compile = Rgo::Compile.new(statements)
      compile.compile

      compile.functions[:public].each do |func|
        @function_to_module_map[func] = node.name
      end

      "import \"#{node.name.downcase}\""
    end

    def pretty(out, indent = 0)
      out.map do |o| ("  " * indent) + o end.join("\n")
    end

    def compile_string(node)
      node.name
    end

    def compile_func_call(node, indent)
      mod = @function_to_module_map[node.name]

      "#{mod.downcase}.#{node.name.capitalize}(" + compile_args(node.children) + ")"
    end

    def compile_args(nodes)
      out = []

      nodes.each do |node|
        case node.type
        when :string
          out << "\"#{node.name}\""
        when :variable
          out << node.name
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

      puts "compile comment :"
      puts node.inspect
      "//#{node.name}"
    end


    def compile_assignment(node, indent)
      "var #{node.name} = #{compile_expression(node.children.first, 0)}"
    end


    def compile_expression(node, indent)
      send("compile_#{node.type}", node, indent)
    end

    def compile_string(node, indent)
      "\"#{node.name}\""
    end
  end
end
