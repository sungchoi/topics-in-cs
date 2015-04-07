require_relative 'least_sum_contiguous_subarray'

def greatest_sum_contiguous_subarray_circular(array)
  least_range = least_sum_contiguous_subarray(array)
  (least_range.last...(least_range.first + array.length))
end
