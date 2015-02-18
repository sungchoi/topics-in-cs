require_relative '../binary_tree/node'
require_relative 'binary_search_tree_node'

# Implement a binary search tree.
# See http://en.wikipedia.org/wiki/Binary_search_tree
# Operations to support:
#   include?(value)     Average O(log n) time
#   insert(value)       Average O(log n) time
#   remove(value)       Average O(log n) time
#   empty?              O(1) time
module BinarySearchTree

  class Node < BinaryTree::Node

    include BinarySearchTree

    def initialize(value, parent = nil, left = nil, right = nil)
      super(value, parent, left, right)
      @size = size?
    end

    # @time worst-case BigO(n)
    # @time average BigO(log n)
    def include?(value)
      return true if self.value == value
      left.include?(value) if left && self.value > value
      right.include?(value) if right && self.value < value
      return false
    end

    # @time worst-case BigO(n)
    # @time average BigO(log n)
    def insert(value)
      node = BinarySearchTreeNode(value)
      direction = value < self.value ? @left : @right
      # NOTE: TODO What if they are ==
      if direction.nil?
        direction = node
      else
        direction.insert(node)
      end

      self
    end

    # @time worst-case BigO(n)
    # @time average BigO(log n)
    def remove(value)
      #TODO
      if children.empty?
        #remove self from parent
      elsif children.length == 1
        #take child and replace self with it
      elsif children.length == 2
        #take left child and replace self with it
      end
    end

    def replace_parent_node
      #TODO
    end

    def find_min
      find_min_node.value
    end

    def find_min_node
      current_node = self
      while current_node.left
        current_node = current_node.left
      end
      current_node
    end

    def sorted?
      return false if left && left.value > self.value
      return false if right && right.value < self.value
      left.sorted? if left
      right.sorted? if right
    end

    def size?
      #TODO
      1 + children.count
    end

  end

end
