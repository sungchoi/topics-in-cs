def number_of_paths_in_a_2d_array_to(x, y)
  return 1 if y == 0 && x == 0
  two_d_array = [[0] + Array.new(x, 1), [1] + Array.new(x, 0)]

  (1..y).each do |row|
    (1..x).each do |col_index|
      two_d_array[1][col_index] = two_d_array[1][col_index - 1] + two_d_array[0][col_index]
    end

    two_d_array[0] = two_d_array[1]
    two_d_array[1] = [1] + Array.new(x, 0)
  end

  two_d_array[0][x]
end
