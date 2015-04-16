def number_of_paths_in_a_2d_obstacle_array_to(x, y, 2d_array)
  2d_array = format_2d_array(2d_array)

  (0..(y)).each do |row|
    (0..(x)).each do |col|

    end
  end
end

def format_2d_array(2d_array)
  2d_array[0].each_with_index do |square, index|
    2d_array[0][index] = square? 0 : 1
  end
end
