def balanced_partition(array)
  array = array.sort
  sum   = array.reduce(&:+)
  subset_max = sum / 2
  max_to_subset_sum_map = Array.new(subset_max + 1, 0)
  max_to_subset_map     = Array.new(subset_max + 1, [])

  array.each_with_index do |int, index|
    subset_max.downto(int) do |max_index|
      if (max_to_subset_sum_map[max_index] - max_index).abs > (max_to_subset_sum_map[max_index - int] + int - max_index).abs
        max_to_subset_sum_map[max_index] = max_to_subset_sum_map[max_index - int] + int
        max_to_subset_map[max_index] = max_to_subset_map[max_index - int] + [int]
      end
    end
  end

  max_to_subset_map[subset_max]
end
