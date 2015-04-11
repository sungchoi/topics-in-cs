def shuffle_naive!(array)
  array.each_with_index do |item, index|
    rand_index = rand(array.length)
    array[index], array[rand_index] = array[rand_index], item
  end

  array
end
