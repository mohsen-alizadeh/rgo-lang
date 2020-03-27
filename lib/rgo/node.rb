module Rgo
  class Node
    attr_accessor :type, :name, :children

    def initialize(type, name, children = [])
      @type = type
      @name = name
      @children = children
    end
  end
end
