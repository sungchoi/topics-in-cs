def greatest_sum_contiguous_subarray_recursive(array, range, cache = {})
  if array.length == 1
    cache[range] = array[0]
  else
  midpoint = array.length / 2
  cache[(0...midpoint)] = greatest_sum_contiguous_subarray_recursive(array[0...midpoint])
  cache[(midpoint...array.length)] = greatest_sum_contiguous_subarray_recursive(array[midpoint..-1])


#   return nil if array.empty?

#   cache = {}
#   array.each_with_index do |int, index|
#     cache[(index..index)] = int
#     puts "cache: #{cache}"
#   end

#   (0..array.length - 1).each do |i|
    
#     (1..array.length - 1).each do |offset|
#       puts "i: #{i}. offset: #{offset}"
#       puts "#{cache[(i..(i + offset))]}"
#       puts "#{cache[(i..(i + offset - 1))]}"
#       puts "#{cache[((i + offset)..(i + offset))]}"
#       if i + offset < array.length - 1
#         cache[(i..(i + offset))] ||= cache[(i..(i + offset - 1))] + cache[((i + offset)..(i + offset))]
#       end
#     end
#   end

#   cache.keys.each do |key|

#   end
end
