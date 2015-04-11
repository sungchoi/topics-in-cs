def shuffle!(array)
  array.each_with_index do |item, index|
    rand_index = index + rand(array.length - index)
    array[index], array[rand_index] = array[rand_index], item
  end

  array
end
