require_relative 'binary_search_tree_node'

class BinarySearchTree

  attr_reader :root, :size

  def initialize
    @root = nil
  end

  # @return [Boolean]
  def include?(value)
    return false if empty?
    @root.include?(value)
  end

  # @return [BinarySearchTree]
  def insert(value)
    if @root
      @root.insert(value)
    else
      @root = BinarySearchTreeNode.new(value)
    end

    self
  end

  # @return [BinarySearchTree]
  def remove(value)
    #what if it is itself? what if it removes more than one?
    @root.remove(value) if @root
    self
  end

  # @return [Integer]
  def size
    size?
  end

  # @return [Boolean]
  def empty?
    size == 0
  end

  # @return [Boolean]
  def size?
    return 0 if @root.nil?
    @root.size?
  end

  def sorted?
    return true if @root.nil?
    @root.sorted?
  end

end
