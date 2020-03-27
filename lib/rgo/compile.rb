module Rgo
  class Compile
    def initialize(statements)
      @statements = statements
    end

    def compile
      compile_statements(@statements)
    end

    def compile_statements(statements, indent = 0)
      statements = Array(statements) unless statements.is_a? Array

      out = []

      statements.each do |statement|
        out << send("compile_#{statement.type}", statement, indent)
      end

      pretty out, indent
    end

    def compile_module(node, indent)
      out = []
      out << "package #{node.name.downcase}"
      out << compile_statements(node.children, indent)

      pretty out, indent
    end

    def compile_include(node, indent)
      "import \"#{node.name.downcase}\""
    end

    def pretty(out, indent = 0)
      out.map do |o| ("  " * indent) + o end.join("\n")
    end

    def compile_string(node)
      node.name
    end

    def compile_func_call(node, indent)
      "fmt.#{node.name.capitalize}(" + compile_args(node.children) + ")"
    end

    def compile_args(nodes)
      out = []

      nodes.each do |node|
        case node.type
        when :string
          out << "\"#{node.name}\""
        end
      end

      pretty out, 0
    end

    def compile_func_def(node, indent)
      out = []
      out << "func #{node.name}() {"
      out << compile_statements(node.children[1], indent + 1)
      out << "}"

      pretty out, indent
    end
    end
end
