def greatest_sum_contiguous_subarray(array)
  range = [0,0]
  min_index = -1
  sum       = 0
  min_sum   = 0
  max_sum   = 0
  greatest_number = array[0]
  greatest_number_index = 0

  array.each_with_index do |int, index|
    if int > greatest_number
      greatest_number_index = index
    end

    sum += int

    if sum < min_sum
      min_sum = sum
      min_index = index
    end

    if sum - min_sum > max_sum
      max_sum = sum - min_sum
      range = [min_index + 1, index + 1]
    end

  end

  if !array.empty? && range[0] == range[1]
    (greatest_number_index...(greatest_number_index + 1))
  else
    (range[0]...range[1])
  end
end
