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

  def initialize(value = nil, opts = {})
    @value = value
    @left  = opts.fetch(:left, nil)
    @right = opts.fetch(:right, nil)
  end

  # @return [Array<BinaryTree::Node>]
  def children
    [@left, @right]
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

  def size
    size?
  end

  def size?(memo = 0)
    memo += 1
    memo = left.size?(memo) if left
    memo = right.size?(memo) if right
    memo
  end

  def to_a
    self.map { |e| e }
  end

  def ==(other)
    return false if !other.instance_of?(self.class)
    self.to_a == other.to_a
  end
end
