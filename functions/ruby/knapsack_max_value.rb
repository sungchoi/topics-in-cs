def knapsack_max_value(sack_size, items)
  max_value_for_sack_size = Array.new(sack_size + 1, 0)
  items.each do |item|
    sack_size.downto(item.weight) do |i|
      max_value_for_sack_size[i] = [max_value_for_sack_size[i], max_value_for_sack_size[i - item.weight] + item.value].max
    end
  end

  max_value_for_sack_size[sack_size]
end
