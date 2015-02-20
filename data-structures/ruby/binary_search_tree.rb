require_relative 'binary_search_tree_node'

class BinarySearchTree

  attr_reader :root, :size

  def initialize
    @root = BinarySearchTreeNode
  end

  # @return [Boolean]
  def include?(value)
    @root.include?(value)
  end

  # @return [BinarySearchTree]
  def insert(value)
    @root = @root.insert(value)

    self
  end

  # @return [BinarySearchTree]
  def remove(value)
    #what if it is itself? what if it removes more than one?
    @root.remove(value)
    self
  end

  # @return [Integer]
  def size
    # TODO Cache Size
    size?
  end

  # @return [Boolean]
  def empty?
    size == 0
  end

  # @return [Boolean]
  def size?
    @root.size?
  end

  def sorted?
    @root.sorted?
  end

end
