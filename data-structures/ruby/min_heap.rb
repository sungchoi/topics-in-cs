require_relative 'key_value'

class MinHeap

  attr_reader :array

  def initialize(array = [])
    @array = array
  end

  def ==(other)
    @array == other.array
  end

  def delete
    MinHeap.new([@array[-1]] + @array[1..-2]).min_heapify_down!
  end

  def delete!
    @array = [@array[-1]] + @array[1..-2]
    min_heapify_down!
  end

  def empty?
    @array.length == 0
  end

  def insert(key_value)
    MinHeap.new(@array + [KeyValue(key_value)]).min_heapify_up!
  end

  def insert!(key_value)
    @array << KeyValue(key_value)
    min_heapify_up!
  end

  def min_heapify_down!
    i        = 0
    smallest = i
    left     = left_child_index(smallest)
    right    = right_child_index(smallest)

    while smallest < @array.length #check this
      smallest = left  if left  <= @array.length - 1 && @array[left]  < @array[smallest]
      smallest = right if right <= @array.length - 1 && @array[right] < @array[smallest]
      if smallest != i
        swap!(i, smallest)
        i     = smallest
        left  = left_child_index(smallest)
        right = right_child_index(smallest)
      else
        return self
      end
    end
  end

  def min_heapify_down_recursive!(i)
    left     = left_child_index(i)
    right    = right_child_index(i)
    smallest = i

    smallest = left  if left  <= @array.length - 1 && @array[left]  < @array[smallest]
    smallest = right if right <= @array.length - 1 && @array[right] < @array[smallest]
    if smallest != i
      swap!(i, smallest)
      min_heapify_down_recursive!(smallest)
    else
      return self
    end
  end

  def min_heapify_up!
    i = @array.length - 1
    while i > 0
      if @array[i] < @array[parent_index(i)]
        @array[i], @array[parent_index(i)] = @array[parent_index(i)], @array[i]
        i = parent_index(i)
      else
        return self
      end
    end

    self
  end

  def peek
    @array[0]
  end

  def pop!
    root = @array[0]
    @array[0] = @array.pop
    min_heapify_down!
    root
  end

  def replace(key_value)
    MinHeap.new([KeyValue(key_value)] + @array[1..-1]).min_heapify_down!
  end

  def replace!(key_value)
    @array[0] = KeyValue(key_value)
    min_heapify_down!
  end

  def size
    @array.length
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

  def parent_index(i)
    index = i / 2
    index = index - 1 if even?(i) && i > 0
    index
  end

  def right_child_index(i)
    (i * 2) + 2
  end

  def swap!(i, i2)
    @array[i], @array[i2] = @array[i2], @array[i]
  end

end
