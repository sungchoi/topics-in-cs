def knapsack_max_value_items(sack_size, items)
  max_value_for_sack_size = Array.new(sack_size + 1, 0)
  max_value_items_for_sack_size = Array.new(sack_size + 1, [])

  items.each_with_index do |item, index|
    sack_size.downto(item.weight) do |i|
      if max_value_for_sack_size[i] < max_value_for_sack_size[i - item.weight] + item.value
        max_value_for_sack_size[i] = max_value_for_sack_size[i - item.weight] + item.value
        max_value_items_for_sack_size[i] = max_value_items_for_sack_size[i - item.weight] + [item]
      end
    end

  end

  max_value_items_for_sack_size[sack_size]
end
