def factorial_inject(num)
  (1..num).inject{|product, x| product * x}
end

def factorial_loop(num)
  product = 1
  1.upto(num) do |x|
    product *= x
  end
  product
end