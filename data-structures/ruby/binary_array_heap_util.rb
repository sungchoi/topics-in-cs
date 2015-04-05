module BinaryArrayHeapUtil

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

  def swap!(array, i, i2)
    array[i], array[i2] = array[i2], array[i]
  end

end
