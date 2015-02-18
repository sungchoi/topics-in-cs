require_relative 'binary_search_tree_node'

module BinarySearchTree

  class Base

    include BinarySearchTree

    def initialize()
      @root = nil
      @size = 0
    end

    def include?(value)
      return false if @size == 0
      @root.include?(value)
    end

    def insert(value)
      if empty?
        @root = BinarySearchTreeNode(value)
      else
        @root.insert(value)
      end

      @size += 1
      self
    end

    def remove(value)
      if empty?
        self
      else
        @root.remove(value) #what if it is itself? what if it removes more than one?
        @size -= 1
        @root = nil if @size == 0
        self
      end
    end

    def empty?
      @size == 0 && @root.nil?
    end

    def size?
      # TODO: Calculate Size
    end

  end

end
