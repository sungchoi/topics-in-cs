
def permutations(array)
  return [array] if array.length == 1
  results = []
  array.each_with_index do |item, index|
    permutations(array[0...index] + array[index+1..-1]).each do |perm|
      results << perm.unshift(item)
    end
  end

  results
end
