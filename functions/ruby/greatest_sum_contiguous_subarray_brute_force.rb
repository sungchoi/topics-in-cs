def greatest_sum_contiguous_subarray_brute_force(array)
  max_sum = 0
  max_range = (0...0)

  array.each_with_index do |int, index|
    1.upto(array.length - index) do |i|
      sum = array[index...(index + i)].reduce(&:+)
      if sum > max_sum
        max_sum = sum
        max_range = (index...(index + i))
      end
    end
  end

  max_range
end
