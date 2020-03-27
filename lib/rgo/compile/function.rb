module Rgo::Compile::Function
  def compile_func_call(node, indent)
    "#{node.name}(" + compile_args(node.children, indent) + ")"
  end

  def compile_args(nodes, indent)
    out = []

    nodes.each do |node|
      case node.type
      when :string
        out << "\"#{node.name}\""
      end
    end

    pretty out, indent
  end

  def compile_func_def(node, indent)
    out = []
    out << "func #{node.name}() {"
    out << compile_statements(node.children[1], indent + 1)
    out << "}"

    pretty out, indent
  end
end
