def fizzbuzz(range)
  range = range.to_a
  range.map! do |num|
    if num % 5 == 0 and num % 3 == 0
      "fizzbuzz"
    elsif num % 5 == 0
      "buzz"
    elsif num % 3 == 0
      "fizz"
    else
      num
    end
  end
end