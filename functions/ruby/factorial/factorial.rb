def factorial(n)
  (1..n).inject { |product, i| product * i }
end

def factorial_inject(n)
  (1..n).inject{ |product, i| product * i }
end

def factorial_loop(n)
  product = 1
  1.upto(n) do |i|
    product *= i
  end

  product
end
