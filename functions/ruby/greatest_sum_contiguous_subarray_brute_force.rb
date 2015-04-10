def greatest_sum_contiguous_subarray_brute_force(array)
  max_sum = 0
  max_range = (0...0)
  greatest_number_index = 0
  greatest_number = array[0]

  array.each_with_index do |int, index|
    if int > greatest_number
      greatest_number = int
      greatest_number_index = index
    end

    1.upto(array.length - index) do |i|
      sum = array[index...(index + i)].reduce(&:+)
      if sum > max_sum
        max_sum = sum
        max_range = (index...(index + i))
      end
    end
  end

  if (!array.empty? && max_range.last == max_range.first)
    (greatest_number_index...(greatest_number_index + 1))
  else
    max_range
  end
end
