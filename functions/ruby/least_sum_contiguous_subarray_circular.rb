require_relative 'greatest_sum_contiguous_subarray'

def least_sum_contiguous_subarray_circular(array)
  return (0...0) if array.empty?
  max_sum_range = greatest_sum_contiguous_subarray(array)
  if max_sum_range.last - max_sum_range.first == 1 && array[max_sum_range][0] < 0
    (0...array.length)
  elsif max_sum_range.last - max_sum_range.first == array.length
    min_index = 0
    min_value = array[0]
    array.each_with_index do |int, index|
      if int < min_value
        min_index = index
        min_value = int
      end
    end
    (min_index...(min_index + 1))
  else
    (max_sum_range.last...(max_sum_range.first + array.length))
  end
end
