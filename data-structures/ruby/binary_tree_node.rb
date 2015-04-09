def BinaryTreeNode(value, opts = {})
  case value
  when BinaryTreeNode
    value
  else
    BinaryTreeNode.new(value, opts)
  end
end

class BinaryTreeNode

  include Enumerable
  attr_reader :value, :left, :right

# Class Methods
  def self.value
    nil
  end

  def self.size
    0
  end

  def self.height
    0
  end

  def self.empty?
    true
  end

  def self.sorted?
    true
  end

  def self.pre_order
  end

  def self.in_order
  end

  def self.post_order
  end

# Instance Methods
  def initialize(value = nil, left = BinaryTreeNode, right = BinaryTreeNode)
    @value = value
    @left  = left
    @right = right
  end

  # @return [Array<BinaryTree::Node>]
  def children
    [@left, @right]
  end

  def empty?
    false
  end

  def sorted?
    return false if @left.instance_of?(BinaryTreeNode)  && @left.value > @value
    return false if @right.instance_of?(BinaryTreeNode) && @right.value < @value
    @left.sorted?
    @right.sorted?
    return true
  end

  def each(option = :pre_order, &block)
    case option
    when :pre_order
      pre_order(&block)
    when :in_order
      in_order(&block)
    when :post_order
      post_order(&block)
    end
  end

  # Implement pre-order traversal of the tree
  def pre_order(&block)
    block.call(self.value)
    left.pre_order(&block)
    right.pre_order(&block)
  end

  # Implement in-order traversal of the tree
  def in_order(&block)
    left.in_order(&block)
    block.call(self.value)
    right.in_order(&block)
  end

  # Implement post-order traversal of the tree
  def post_order(&block)
    left.post_order(&block)
    right.post_order(&block)
    block.call(self.value)
  end

  def size
    1 + left.size + right.size
  end

  def height
    1 + [left.height, right.height].max
  end

  def ==(other)
    return false if !other.instance_of?(self.class)
    self.to_a == other.to_a
  end
end
