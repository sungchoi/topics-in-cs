def least_sum_contiguous_subarray(array)
  range = [0,0]
  max_index = -1
  sum = 0
  min_sum = 0
  max_sum = 0
  smallest_number = array[0]
  smallest_number_index = 0

  array.each_with_index do |int, index|
    if int < smallest_number
      smallest_number_index = index
      smallest_number = int
    end

    sum -= int

    if sum < max_sum
      max_sum = sum
      max_index = index
    end

    if sum + max_sum > min_sum
      min_sum = sum - max_sum
      range = [max_index + 1, index + 1]
    end
  end

  if range[0] == range[1] && !array.empty?
    (smallest_number_index...(smallest_number_index + 1))
  else
    (range[0]...range[1])
  end
end
