require_relative 'binary_search_tree_node'

class BinarySearchTree

  attr_reader :root, :size

  def initialize
    @root = BinarySearchTreeNode
  end

  # @param [Comparable] key
  # @return [Boolean]
  def include?(key)
    @root.include?(key)
  end

  # @param [Object, Object] key_value
  # @return [BinarySearchTree]
  def insert(key)
    @root = @root.insert(key)
    self
  end

  # @param [Comparable] key
  # @return [BinarySearchTree]
  def remove(key)
    @root = @root.remove(key)
    self
  end

  # @param [Comparable] key
  def find(key)
    @root.find(key)
  end

  # @return [Boolean]
  def empty?
    @root.empty?
  end

  # @return [Integer]
  def size
    @root.size
  end

  # @return [Boolean]
  def sorted?
    @root.sorted?
  end

end
