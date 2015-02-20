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

  def self.insert_subtree(subtree)
    puts ".insert_subtree. subtree: #{subtree}"
    subtree
  end

  def self.remove(value)
    puts ".remove. value: #{value}"
    self
  end

  def self.include?(value)
    false
  end

  def self.size?(memo = 0)
    memo
  end

  def self.sorted?
    true
  end

  def self.value
    0
  end

############################################################
# Instance Methods
############################################################
# TODO:   def initialize(value, left = BinarySearchTreeNode, right = BinarySearchTreeNode, parent = nil)
# TODO:   How to deal with value comaprisons in #sorted?
  def initialize(value, opts = {})
    opts[:left]  ||= BinarySearchTreeNode
    opts[:right] ||= BinarySearchTreeNode
    super(value, opts)
  end

  # @time worst-case BigO(n)
  # @time average BigO(log n)
  def include?(value)
    return true if self.value == value
    in_left  = left.include?(value)  if self.value > value
    in_right = right.include?(value) if self.value < value
    (in_left || in_right) ? true : false
  end

  # @time worst-case BigO(n)
  # @time average BigO(log n)
  # @param [Comparable] value
  def insert(value)
    # TODO Make this non destructive
    # NOTE: TODO What if they are == ? Nothing? Or overwrite? Overwrite. key_value
    dup = self.dup
    return dup if value == @value
    if value < @value
      dup.left = @left.dup.insert(value)
    else
      dup.right = @right.dup.insert(value)
    end

    dup
  end

  def insert_subtree(subtree)
    new_tree = self.dup
    subtree.each do |key_value|
      new_tree = new_tree.insert(key_value)
    end

    new_tree
  end

  # @time worst-case BigO(n)
  # @time average BigO(log n)
  def remove(value)
    # TODO Make this non destructive
    dup = self.dup
    if value == @value
      return @left.dup.insert_subtree(@right.dup)
    elsif value < @value
      dup.left = @left.dup.remove(value)
    else
      dup.right = @right.dup.remove(value)
    end

    dup
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

  protected
  def left=(value)
    @left = value
  end

  def right=(value)
    @right = value
  end

end
