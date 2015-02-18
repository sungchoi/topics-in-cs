require_relative 'binary_tree_node'

def BinarySearchTreeNode(value, left = nil, right = nil, parent = nil)
  case value
  when BinarySearchTreeNode
    value
  else
    BinarySearchTreeNode.new(value, left, right, parent)
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

  def initialize(value, left = nil, right = nil, parent = nil)
    super(value, left, right, parent)
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

end
