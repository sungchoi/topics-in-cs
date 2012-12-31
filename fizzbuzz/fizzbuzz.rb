def fizzbuzz(range)
  range = range.to_a
  range.map! do |num|
    output = nil
    output = output.to_s + "fizz" if num % 3 == 0 
    output = output.to_s + "buzz" if num % 5 == 0
    output ||= num
  end
end

# # old version:
# def fizzbuzz(range)
#   range = range.to_a
#   range.map! do |num|
#     if num % 5 == 0 and num % 3 == 0
#       "fizzbuzz"
#     elsif num % 5 == 0
#       "buzz"
#     elsif num % 3 == 0
#       "fizz"
#     else
#       num
#     end
#   end
# end