def BinaryTreeNode(value, parent = nil, left = nil, right = nil)
  case value
  when BinaryTreeNode
    value
  else
    BinaryTreeNode.new(value, parent, left, right)
  end
end

class BinaryTreeNode

  attr_accessor :value, :parent, :left, :right

  def initialize(value = nil, parent = nil, left = nil, right = nil)
    @value = value
    @parent = parent
    @left  = left
    @right = right
  end

  # @return [Array<BinaryTree::Node>]
  def children
    [@left, @right]
  end

  def each(&block)
    pre_order(&block)
  end

  # Implement pre-order traversal of the tree
  def pre_order(&block)
    block.call(self.value)
    left.pre_order(&block) if left
    right.pre_order(&block) if right
  end

  # Implement in-order traversal of the tree
  def in_order(&block)
    left.in_order(&block) if left
    block.call(self.value)
    right.in_order(&block) if right
  end

  # Implement post-order traversal of the tree
  def post_order(&block)
    left.post_order(&block) if left
    right.post_order(&block) if right
    block.call(self.value)
  end

  def ==(other)
    return false if !other.instance_of?(self.class)
    #TODO
  end
end
