def shuffle_more_naive!(array)
  array.length.times do
    rand_index_one = rand(array.length)
    rand_index_two = rand(array.length)
    array[rand_index_one], array[rand_index_two] = array[rand_index_two], array[rand_index_one]
  end

  array
end
