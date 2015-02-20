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


class BinarySearchTreeNode < BinaryTreeNode

############################################################
# Class Methods
############################################################
  def self.insert(value)
    BinarySearchTreeNode.new(value)
  end

  def self.insert_subtree(subtree)
    puts ".insert_subtree. subtree: #{subtree}"
    subtree
  end

  def self.remove(value)
    puts ".remove. value: #{value}"
    self
  end

  def self.include?(value)
    false
  end

  def self.size?(memo = 0)
    memo
  end

  def self.sorted?
    true
  end

  def self.value
    0
  end

############################################################
# Instance Methods
############################################################
# TODO:   def initialize(value, left = BinarySearchTreeNode, right = BinarySearchTreeNode, parent = nil)
# TODO:   How to deal with value comaprisons in #sorted?
  def initialize(value, opts = {left: BinarySearchTreeNode, right: BinarySearchTreeNode})
    puts "value: #{value}, opts: #{opts}"
    super(value, opts)
  end

  # @time worst-case BigO(n)
  # @time average BigO(log n)
  def include?(value)
    return true if self.value == value
    in_left = left.include?(value) if self.value > value
    in_right = right.include?(value) if self.value < value
    (in_left || in_right) ? true : false
  end

  # @time worst-case BigO(n)
  # @time average BigO(log n)
  # @param [Comparable] value
  def insert(value)
    # TODO Make this non destructive
    # NOTE: TODO What if they are == ? Nothing? Or overwrite? Overwrite. key_value
    return self if value == @value
    if value < @value
      @left ? @left.insert(value) : @left = BinarySearchTreeNode.new(value)
    else
      @right ? @right.insert(value) : @right = BinarySearchTreeNode.new(value)
    end

    self
  end

  def insert_subtree(subtree)
    subtree.each do |key_value|
      insert(key_value)
    end

    self
  end

  # @time worst-case BigO(n)
  # @time average BigO(log n)
  def remove(value)
    # TODO Make this non destructive
    puts "#remove"
    puts "value: #{value}, @value: #{@value}"
    #TODO
    if value == @value
      puts "value == @value. @left.insert_subtree(@right): #{@left.insert_subtree(@right)}"
      return @left.insert_subtree(@right)
    elsif value < @value
      @left = @left.remove(value)
    else
      @right = @right.remove(value)
    end

    self
  end

  def remove!(value)
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
    return true
  end

  private
  def value=(value)
    @value = value
  end

  # def >(other)

  # end

  # def <(other)
  # end

end
