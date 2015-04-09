require_relative 'key_value'

class MaxHeapNode

  def self.delete
    MaxHeapNode
  end

  def self.empty?
    true
  end

  def self.full?
    false
  end

  def self.has_children?
    false
  end

  def self.height
    0
  end

  def self.insert(key_value)
    MaxHeapNode.new(KeyValue(key_value))
  end

  def self.key
    nil
  end

  def self.key_value
    nil
  end

  def self.leaf?
    true
  end

  def self.not_empty?
    false
  end

  def self.peek
    [nil, nil]
  end

  def self.each
  end

  def self.pre_order
  end

  def self.in_order
  end

  def self.post_order
  end

  def self.reverse_post_order
  end

  def self.sorted?
    true
  end

  def self.value
    nil
  end

  include Enumerable
  attr_reader :key_value, :left, :right

  # @param [Array<Object, Object>] key_value
  # @param [MaxHeapNode] left
  # @param [MaxHeapNode] right
  def initialize(key_value, left = MaxHeapNode, right = MaxHeapNode)
    @key_value = KeyValue(key_value)
    @left = left
    @right = right
    build_max_heap
  end

  def build_max_heap
    self.each(:reverse_post_order) do |node|
      if node.leaf?
        node
      else 
        node.max_heapify_down
      end
    end
  end

  def delete
    case number_of_children
    when 0
      MaxHeapNode
    when 1
      MaxHeapNode.new(@left.key_value)
    when 2
      left  = @left
      right = @right
      if (left.height == right.height)
        if @left.key > @right.key
          left  = MaxHeapNode.new(@right.key_value, @left.left, @left.right)
          right = MaxHeapNode.new(@left.key_value, @right.left, @right.right)
        end
        MaxHeapNode.new(right.key_value, left, right.delete)
      else
        if @right > @left
          left  = MaxHeapNode.new(@right.key_value, @left.left, @left.right)
          right = MaxHeapNode.new(@left.key_value, @right.left, @right.right)
        end
        MaxHeapNode.new(left.key_value, left.delete, right)
      end
    end
  end

  def each(option = :pre_order, &block)
    case option
    when :pre_order
      pre_order(&block)
    when :in_order
      in_order(&block)
    when :post_order
      post_order(&block)
    when :reverse_post_order
      reverse_post_order(&block)
    end
  end

  def empty?
    false
  end

  def full?
    return false if !@left.instance_of?(MaxHeapNode) || !@right.instance_of?(MaxHeapNode)
    @left.full?
    @right.full?
    return true
  end

  def has_children?
    @left.instance_of?(MaxHeapNode)
  end

  def height
    1 + @left.height
  end

  def insert(key_value)
    key_value    = KeyValue(key_value)
    left         = @left
    right        = @right
    left_height  = @left.height
    right_height = @right.height

    if key_value.key > self.key
      if left_height == right_height && (!@left.full? || @right.full?)
        left = @left.insert(@key_value)
      elsif left_height > right_height && !@left.full?
        left = @left.insert(@key_value)
      else
        right = @right.insert(@key_value)
      end


        MaxHeapNode.new(key_value, left, right)
    else
      if left_height == right_height && (!@left.full? || @right.full?)
        left = @left.insert(key_value)
      elsif left_height > right_height && !@left.full?
        left = @left.insert(key_value)
      else
        right = @right.insert(key_value)
      end

      MaxHeapNode.new(@key_value, left, right)
    end
  end

  def key
    @key_value.key
  end

  def leaf?
    !@left.instance_of?(MaxHeapNode)
  end

  def max_heapify_down
      return self if self.leaf?
      largest = self
      largest = @left  if @left.instance_of?(MaxHeapNode)  && @left.key  > largest.key
      largest = @right if @right.instance_of?(MaxHeapNode) && @right.key > largest.key

      if @left.instance_of?(MaxHeapNode) && largest == @left
        MaxHeapNode.new(@left.key_value, MaxHeapNode.new(@key_value, @left.left, @left.right).max_heapify_down, @right)
      elsif @right.instance_of?(MaxHeapNode) && largest == @right
        MaxHeapNode.new(@right.key_value, @left, MaxHeapNode.new(@key_value, @right.left, @right.right).max_heapify_down)
      else
        return self
      end
  end

  def not_empty?
    true
  end

  def number_of_children
    number = 0
    number += 1 if @left.instance_of?(MaxHeapNode)
    number += 1 if @right.instance_of?(MaxHeapNode)
    number
  end

  def peek
    @key_value
  end

  def sorted?
    return false if (@left.not_empty? && key < @left.key) || (@right.not_empty? && key < @right.key)
    @left.sorted?
    @right.sorted?
    return true
  end

  def value
    @key_value.value
  end

  def in_order(&block)
    @left.pre_order(&block)
    block.call(self)
    @right.pre_order(&block)
  end

  def post_order(&block)
    @left.pre_order(&block)
    @right.pre_order(&block)
    block.call(self)
  end

  def pre_order(&block)
    block.call(self)
    @left.pre_order(&block)
    @right.pre_order(&block)
  end

  def reverse_post_order(&block)
    @right.reverse_post_order(&block)
    @left.reverse_post_order(&block)
    block.call(self)
  end

end
