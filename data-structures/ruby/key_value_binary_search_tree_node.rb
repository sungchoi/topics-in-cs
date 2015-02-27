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


class KeyValueBinarySearchTreeNode


# Class Methods
############################################################

  def self.insert(key_value)
    KeyValueBinarySearchTreeNode.new(key_value)
  end

  def self.insert_subtree(subtree)
    subtree
  end

  def self.remove(key)
    self
  end

  def self.include?(key)
    false
  end

  def self.find(key)
    nil
  end

  def self.size
    0
  end

  def self.sorted?
    true
  end

  def self.value
    0
  end

  def self.pre_order
  end

# Instance Methods
############################################################

  def initialize(key_value_pair, opts = {})
    key_value_pair = Array(key_value_pair) #coersion
    opts[:left]  ||= BinarySearchTreeNode
    opts[:right] ||= BinarySearchTreeNode
    @tree = BinaryTreeNode.new(key_value_pair, opts)
  end

  def key
    @tree.value[0]
  end

  def key_value
    @tree.value[1]
  end

  def key_value_pair
    @tree.value
  end

  def left
    @tree.left
  end

  def right
    @tree.right
  end

  # @time worst-case BigO(n)
  # @time average BigO(log n)
  def include?(key)
    return true if @key == key
    in_left  = left.include?(key)  if @key > key
    in_right = right.include?(key) if @key < key
    (in_left || in_right) ? true : false
  end

  # @time worst-case BigO(n)
  # @time average BigO(log n)
  # @param [Comparable] value
  def insert(key_value_pair)
    # NOTE: TODO What if they are == ? Nothing? Or overwrite? Overwrite. key_value
    dup = KeyValueBinarySearchTreeNode(key_value_pair, left, right)
    return dup if key_value_pair[0] == key
    if @key < key
      dup.left = dup.left.insert(key_value_pair)
    else
      dup.right = dup.right.insert(key_value)
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
  def remove(key)
    dup = self.dup
    if @key == key
      return @left.dup.insert_subtree(@right.dup)
    elsif @key < key
      dup.left = @left.dup.remove(key)
    else
      dup.right = @right.dup.remove(key)
    end

    dup
  end

  # @param [Comparable] key
  # @return [Object|nil]
  def find(key)
    if key == @key
      return key_value
    elsif key < @key
      @left.find(key)
    else
      @right.find(key)
    end
  end

  def sorted?
    return false if left.key > self.key
    return false if right.key < self.key
    left.sorted?
    right.sorted?
    return true
  end

  def min
    find_min_node.value
  end

  def find_min_node
    current_node = self
    while current_node.left
      current_node = current_node.left
    end
    current_node
  end

  protected
  def left=(value)
    @left = value
  end

  def right=(value)
    @right = value
  end

end
