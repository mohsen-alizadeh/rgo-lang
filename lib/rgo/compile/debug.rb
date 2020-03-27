module Rgo::Compile::Debug
  def pretty(out, indent)
    out.map do |o| ("  " * indent) + o end.join("\n")
  end
end
