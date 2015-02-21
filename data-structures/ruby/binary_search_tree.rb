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
  def insert(key_value)
    # key_value = Array(key_value) #coersion
    @root = @root.insert(key_value)
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

  # @return [Integer]
  def size
    # TODO Cache Size
    size?
  end

  # @return [Boolean]
  def empty?
    size == 0
  end

  # @return [Integer]
  def size?
    @root.size?
  end

  # @return [Boolean]
  def sorted?
    @root.sorted?
  end

end
