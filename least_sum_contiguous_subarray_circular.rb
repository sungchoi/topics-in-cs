require_relative 'greatest_sum_contiguous_subarray'

def least_sum_contiguous_subarray_circular(array)
  max_sum_range = greatest_sum_contiguous_subarray(array)
  if max_sum_range.last - max_sum_range.first == 1 && array[max_sum_range][0] < 0
    ((max_sum_range.last - 1)...(max_sum_range.first + array.length))
  else
    (max_sum_range.last...(max_sum_range.first + array.length))
  end
end
