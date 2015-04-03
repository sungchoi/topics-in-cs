require_relative 'binary_tree_node'

def BinarySearchTreeNode(value, opts)
  case value
  when BinarySearchTreeNode
    value
  else
    BinarySearchTreeNode.new(value, opts)
  end
end

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

  def self.value
    nil
  end

  def self.min
    nil
  end

  def self.max
    nil
  end

  def self.insert(value)
    BinarySearchTreeNode.new(value)
  end

  def self.insert_subtree(subtree)
    subtree
  end

  def self.remove(value)
    self
  end

  def self.include?(value)
    false
  end

  def empty?
    true
  end

  def self.sorted?
    true
  end

############################################################
# Instance Methods
############################################################

  def initialize(value, left = BinarySearchTreeNode, right = BinarySearchTreeNode)
    #TODO Remove dependency on BinaryTreeNode. Make BinarySearchTreeNode an independent class.
    super(value, left, right)
  end

  # @time worst-case BigO(n)
  # @time average BigO(log n)
  # @return [Boolean]
  def include?(value)
    return true if self.value == value
    in_left  = left.include?(value)  if self.value > value
    in_right = right.include?(value) if self.value < value
    (in_left || in_right) ? true : false
  end

  # @time worst-case BigO(n)
  # @time average BigO(log n)
  # @param [Comparable] value
  # @return [BinarySearchTreeNode]
  def insert(value)
    return self if value == @value
    if value < @value
      BinarySearchTreeNode.new(@value, @left.insert(value), @right)
    else
      BinarySearchTreeNode.new(@value, @left, @right.insert(value))
    end
  end

#  # @time BigO(n) linear
#  # TODO: @time BigO(log n)
  def insert_subtree(subtree)
    subtree_value = subtree.value
    if subtree_value < @value
      BinarySearchTreeNode.new(@value, @left.insert_subtree(subtree), @right)
    elsif subtree_value > @value
      BinarySearchTreeNode.new(@value, @left, @right.insert_subtree(subtree))
    end
  end

  # @time worst-case BigO(n)
  # @time average BigO(log n)
  def remove(value)
    return BinarySearchTreeNode if @value == value && @left.empty? && @right.empty?

    if value == @value
      max_value = max
      return BinarySearchTreeNode.new(max_value, @left.insert_subtree(@right.remove(max_value))) if max_value

      min_value = min
      return BinarySearchTreeNode.new(min_value, BinarySearchTreeNode, @right.insert_subtree(@left.remove(min_value))) if min_value
    elsif value < @value
      BinarySearchTreeNode.new(@value, @left.remove(value), @right)
    elsif value > @value
      BinarySearchTreeNode.new(@value, @left, @right.remove(value))
    end
  end

  # @param [Comparable] value
  # @return [Object?]
  def find(value)
    if value == @value
      return self
    elsif value < @value
      @left.find(value)
    else
      @right.find(value)
    end
  end

  def min
    [@left.min, @value].select { |obj| obj }.min
  end

  def max
    [@right.max, @value].select { |obj| obj }.max
  end

  def find_min_node
    current_node = self
    while current_node.left.instance_of?(BinarySearchTreeNode)
      current_node = current_node.left
    end
    current_node
  end

  # @time BigO(log n)
  def find_max_node
    current_node = self
    while current_node.right.instance_of?(BinarySearchTreeNode)
      current_node = current_node.right
    end
    current_node
  end

  # @time BigO(log n)
  def find_and_remove_min_node

  end

  # @time BigO(log n)
  def find_and_remove_max_node
  end

  # @time BigO(log n)
  # @return [Comparable] min value
  def find_and_remove_min_node!
    current_node = self
    left_child = current_node.left
    while left_child.right.instance_of(BinarySearchTreeNode)
      current_node = left_child
      left_child = left_child.left
    end
    @left = BinarySearchTreeNode
    left_child.value
  end

  # @time BigO(log n)
  # @return [Comparable] max value
  def find_and_remove_max_node!
    current_node = self
    right_child = current_node.right
    while right_child.right.instance_of(BinarySearchTreeNode)
      current_node = right_child
      right_child = right_child.right
    end
    @right = BinarySearchTreeNode
    right_child.value
  end

  def sorted?
    return false if @left.instance_of?(BinarySearchTreeNode)  && @left.value > @value
    return false if @right.instance_of?(BinarySearchTreeNode) && @right.value < @value
    @left.sorted?
    @right.sorted?
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
