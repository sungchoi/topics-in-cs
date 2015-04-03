require_relative 'key_value'

class MaxHeap

  attr_reader :array

  def initialize(array = [])
    @array = array.map { |e| KeyValue(e) }
    #heapify to sort the array
  end

  def ==(other)
    @array == other.array
  end

  def delete
    if @array.length < 2
      MaxHeap.new([])
    else
      MaxHeap.new([@array[-1]] + @array[1..-2]).max_heapify_down!
    end
  end

  def delete!
    if @array.length < 2
      @array.pop
      return self
    else
      @array = [@array[-1]] + @array[1..-2]
      max_heapify_down!
    end
  end

  def empty?
    @array.length == 0
  end

  def insert(key_value)
    MaxHeap.new(@array + [KeyValue(key_value)]).max_heapify_up!
  end

  def insert!(key_value)
    @array << KeyValue(key_value)
    max_heapify_up!
  end

  def max_heapify_up!
    i = @array.length - 1
    while i > 0
      if @array[i] > @array[parent_index(i)]
        swap!(i, parent_index(i))
        i = parent_index(i)
      else
        return self
      end
    end

    self
  end

  def max_heapify_down!
    i = 0
    largest = i
    left    = left_child_index(largest)
    right   = right_child_index(largest)

    while largest < @array.length
      largest = left  if left  <= @array.length - 1 && @array[left]  > @array[largest]
      largest = right if right <= @array.length - 1 && @array[right] > @array[largest]
      if largest == i
        return self
      else
        swap!(i, largest)
        i = largest
      end
    end
  end

  def max_heapify_down_recursive!(i)
    left    = left_child_index(i)
    right   = right_child_index(i)
    largest = i

    largest = left  if left  <= @array.length - 1 && @array[left]  > @array[largest]
    largest = right if right <= @array.length - 1 && @array[right] > @array[largest]
    if i != largest
      swap!(i, largest)
      max_heapify_down_recursive!(largest)
    else
      return self
    end

  end

  def peek
    @array[0]
  end

  def pop!
    root   = @array[0]
    @array[0] = @array.pop
    max_heapify_down!
    root
  end

  def replace(key_value)
    MaxHeap.new([KeyValue(key_value)] + @array[1..-1]).max_heapify_down!
  end

  def replace!(key_value)
    @array[0] = KeyValue(key_value)
    max_heapify_down!
  end

  def parent_index(i)
    index = i / 2
    index = index - 1 if even?(i) && i > 0
    index
  end

  private

  def even?(i)
    i % 2 == 0
  end

  def left_child_index(i)
    (i * 2) + 1
  end

  def odd?(i)
    i % 2 == 1
  end

  def right_child_index(i)
    (i * 2) + 2
  end

  def swap!(i, i2)
    @array[i], @array[i2] = @array[i2], @array[i]
  end

end
