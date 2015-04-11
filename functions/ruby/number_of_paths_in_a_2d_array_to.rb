def number_of_paths_in_a_2d_array_to(m, n)
  return 1 if m == 0 && n == 0
  two_d_array = [[0] + Array.new(n, 1), [1] + Array.new(n, 0)]

  (1..m).each do |row|
    (1..n).each do |col_index|
      two_d_array[1][col_index] = two_d_array[1][col_index - 1] + two_d_array[0][col_index]
    end

    two_d_array[0] = two_d_array[1]
    two_d_array[1] = [1] + Array.new(n, 0)
  end

  two_d_array[0][n]
end



