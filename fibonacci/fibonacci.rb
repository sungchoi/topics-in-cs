def fibonacci_recursive(index)
  if index == 0
    0
  elsif index == 1
    1
  else
    fibonacci_recursive(index - 1) + fibonacci_recursive(index - 2)
  end
end

def fibonacci_recursive_with_dp(index) # dynamic processing stores the result of each recursive calculation so that redundant calculations are not carried out
  fibonacci_sequence = [0,1]
  if fibonacci_sequence[index]
    fibonacci_sequence[index]
  else
    fibonacci_recursive_with_dp(index - 1) + fibonacci_recursive_with_dp(index - 2)
  end
end

def fibonacci_recursive_with_dp_enhanced(index) 
# dynamic processing stores the result of each recursive calculation so that redundant calculations are not carried out
# only the last two numbers calculated for the sequence are stored at any one time

end

def fibonacci_nonrecursive(index)

end