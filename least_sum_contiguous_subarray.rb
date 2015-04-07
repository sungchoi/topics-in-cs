def least_sum_contiguous_subarray(array)
  range = [0,0]
  max_index = -1
  sum = 0
  min_sum = 0
  max_sum = 0

  array.each_with_index do |int, index|
    sum += int

    if sum > max_sum
      max_sum = sum
      max_index = index
    end

    if sum - max_sum < min_sum
      min_sum = sum - max_sum
      range = [max_index + 1, index + 1]
    end
  end

    (range[0]...range[1])
end
