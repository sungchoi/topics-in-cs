require_relative 'binary_tree_node'

# def BinarySearchTreeNode(value, left = nil, right = nil, parent = nil)
#   case value
#   when BinarySearchTreeNode
#     value
#   else
#     BinarySearchTreeNode.new(value, left, right, parent)
#   end
# end

# Implement a binary search tree.
# See http://en.wikipedia.org/wiki/Binary_search_tree
# Operations to support:
#   include?(value)     Average O(log n) time
#   insert(value)       Average O(log n) time
#   remove(value)       Average O(log n) time
#   empty?              O(1) time


class BinarySearchTreeNode < BinaryTreeNode

############################################################
# Class Methods
############################################################
  def self.insert(value)
    BinarySearchTreeNode.new(value)
  end

  def self.remove(value)
    self
  end

  def self.size?
    0
  end

  def self.sorted?
    true
  end

############################################################
# Instance Methods
############################################################
# TODO:   def initialize(value, left = BinarySearchTreeNode, right = BinarySearchTreeNode, parent = nil)
# TODO:   How to deal with value comaprisons in #sorted?
  def initialize(value, left = nil, right = nil, parent = nil)
    super(value, left, right, parent)
  end

  # @time worst-case BigO(n)
  # @time average BigO(log n)
  def include?(value)
    return true if self.value == value
    in_left = left.include?(value) if left && self.value > value
    in_right = right.include?(value) if right && self.value < value
    (in_left || in_right) ? true : false
  end

  # @time worst-case BigO(n)
  # @time average BigO(log n)
  # @param [Comparable] value
  def insert(value)
    # NOTE: TODO What if they are == ? Nothing? Or overwrite?
    return self if value == @value
    if value < @value
      @left ? @left.insert(value) : @left = BinarySearchTreeNode.new(value)
    else
      @right ? @right.insert(value) : @right = BinarySearchTreeNode.new(value)
    end

    self
  end

  # @time worst-case BigO(n)
  # @time average BigO(log n)
  def remove(value)
    #TODO
    if children.empty?
      #remove self from parent
      parent.left = nil if self == parent.left
      parent.right = nil if self == parent.right
    elsif children.length == 1
      #take child and replace self with it
      child = child.left ? left : right
      parent.left = child if self == parent.left
      parent.right = child if self == parent.right
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
    return true
  end

  private
  def value=(value)
    @value = value
  end

end
