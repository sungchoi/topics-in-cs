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

  def insert(key_value)
    MinHeap.new(@array + [KeyValue(key_value)]).min_heapify_up!
  end

  def insert!(key_value)
    @array << KeyValue(key_value)
    min_heapify_up!
  end

  def peek
    @array[0]
  end

  private

  def even?(i)
    i % 2 == 0
  end

  def left_child_index(i)
    (i * 2) + 1
  end

  def min_heapify_up!
    i = @array.length - 1
    while i > 0
      if @array[i] < @array[parent_index(i)]
        @array[i], @array[parent_index(i)] = @array[parent_index(i)], @array[i]
        i = parent_index(i)
      else
        return
      end
    end
  end

  def min_heapify_down!
    i        = 0
    smallest = i
    left     = left_child_index(smallest)
    right    = right_child_index(smallest)

    while smallest < @array.length #check this
      smallest = left  if left <= @array - 1 && @array[left].key < @array[smallest].key
      smallest = right if right <= @array.length - 1 && @array[right].key < @array[smallest].key
      if smallest != i
        swap!(i, smallest)
        i = smallest
      else
        return
      end
    end
  end

  def min_heapify_down_recursive!(i)
    left = left_child_index(i)
    right = right_child_index(i)
    smallest = i

    smallest = left if left <= @array.length - 1 && @array[left].key < @array[smallest].key
    smallest = right if right <= @array.length - 1 && @array[right].key < @array[smallest].key
    if smallest != i
      swap!(i, smallest)
      min_heapify_down!(smallest)
    end
  end

  def odd?(i)
    i % 2 == 1
  end

  def parent_index(i)
    i = i / 2
    i -= 1 if even?(i)
  end

  def right_child_index(i)
    (i * 2) + 2
  end

  def swap!(i, i2)
    @array[i], @array[i2] = @array[i2], @array[i]
  end

end