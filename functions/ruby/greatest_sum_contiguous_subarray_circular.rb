require_relative 'least_sum_contiguous_subarray'

def greatest_sum_contiguous_subarray_circular(array)
  least_range = least_sum_contiguous_subarray(array)

  if least_range.last - least_range.first == 1 && array[least_range][0] > 0
    ((least_range.last - 1)...(least_range.first + array.length))
  else
    (least_range.last...(least_range.first + array.length))
  end
end
