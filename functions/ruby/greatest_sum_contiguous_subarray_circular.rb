require_relative 'least_sum_contiguous_subarray'

def greatest_sum_contiguous_subarray_circular(array)
  return (0...0) if array.empty?
  least_range = least_sum_contiguous_subarray(array)

  if least_range.last - least_range.first == 1 && array[least_range][0] > 0
    (0...array.length)
  elsif least_range.last - least_range.first == array.length
    max_index = 0
    max_value = array[0]
    array.each_with_index do |int, index|
      if int > max_value
        max_index = index
        max_value = int
      end
    end
    (max_index...(max_index + 1))
  else
    (least_range.last...(least_range.first + array.length))
  end
end
