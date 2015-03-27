module BTree

  class Node

    def initialize(value, left = nil, right = nil)
      @value  = value
      @left   = left
      @right  = right
    end

    def leaf?
      @left.nil? && @right.nil?
    end

  end

end
