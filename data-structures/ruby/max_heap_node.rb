require_relative 'key_value'

class MaxHeapNode

  def self.key_value
    nil
  end

  def self.key
    nil
  end

  def self.value
    nil
  end

  def height
    0
  end

  def full?
    false
  end

  def sorted?
    true
  end

  def self.insert(key_value)
    MaxHeapNode.new(KeyValue(key_value))
  end

  def self.delete
    MaxHeapNode
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

  def self.sorted?
    true
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
  end

  def ==(other)
    self.to_a == other.to_a
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
    end
  end

  def full?
    return false if @left.instance_of(MaxHeapNode) != @right.instance_of(MaxHeapNode)
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
    key_value = KeyValue(key_value)
    key = key_value.key
    left_height  = @left.height
    right_height = @right.height
    if key <= @key
      if (left_height == right_height && @right.full?) ||
         (left_height > right_height && !@left.full?)
        MaxHeapNode.new(@key_value, @left.insert(key_value), @right)
      else
        MaxHeapNode.new(@key_value, @left, @right.insert(key_value))
      end

    else
      if (left_height == right_height && @right.full?) ||
         (left_height > right_height && !@left.full?)
        MaxHeapNode.new(key_value, @left.insert(@key_value), @right)
      else
        MaxHeapNode.new(key_value, @left, @right.insert(@key_value))
      end

    end
  end

  def key
    @key_value.key
  end

  def number_of_children
    number = 0
    number += 1 if !@left.instance_of?(MaxHeapNode)
    number += 1 if !@right.instance_of?(MaxHeapNode)
  end

  def peek
    @key_value
  end

  def sorted?
    return false if @key < @left.key || @key < @right.key
    @left.sorted?
    @right.sorted?
    return true
  end

  def value
    @key_value.value
  end

  private

  def in_order(&block)
    @left.pre_order(&block)
    block.call(@key, @value)
    @right.pre_order(&block)
  end

  def post_order(&block)
    @left.pre_order(&block)
    @right.pre_order(&block)
    block.call(@key, @value)
  end

  def pre_order(&block)
    block.call(@key, @value)
    @left.pre_order(&block)
    @right.pre_order(&block)
  end

end
