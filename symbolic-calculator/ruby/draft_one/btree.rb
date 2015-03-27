module BTree

  class BTree
    attr_accessor :root

    def initialize(root = Sentinel.new) # wonder if specifying a sentinel class instead of Node.new(nil, nil, nil) will unwanted side effects
      @root = root
    end

    def build(collection)
      #probably needs to be implemented by subclasses of BTree: balanced, expression, sorted, etc.
    end

    # def findTopMostNotFullNode
      # recurse through levels and return first 
    # end

  end

  class Node

    attr_accessor :value, :left, :right

    def initialize(options = {})
      @value  = options.fetch(:value, nil)
      @left   = options.fetch(:left, nil)
      @right  = options.fetch(:right, nil)
    end

    def full?
      @right && @left
    end

    def empty?
      !@right && !@left
    end

    def half_full?
      !@right || !@left
    end

    def not_full?
      !full
    end

    def to_leaf
      Leaf.new(self.value)
    end

  end

  class Leaf
    def initialize(value)
      @value  = value
    end

    def to_node(options = {})
      # allows for the overriding of the value
      Node.new({value: self.value}.merge(options))
    end

  end

  class Sentinel

    def initialize
    end

  end

end