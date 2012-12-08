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
    fibonacci_sequence[index] = fibonacci_recursive_with_dp(index - 1) + fibonacci_recursive_with_dp(index - 2)
  end
end

def fibonacci_nonrecursive(index) 
# dynamic processing stores the result of each recursive calculation so that redundant calculations are not carried out
# only the last two numbers calculated for the sequence are stored at any one time
  fibonacci_sequence = [0,1]
  if fibonacci_sequence[index]
    fibonacci_sequence[index]
  else
    (index - 1).times do
      temp = fibonacci_sequence[0] + fibonacci_sequence[1] # save next number in sequence
      fibonacci_sequence[0] = fibonacci_sequence[1] # move the number in index 1 to index 0
      fibonacci_sequence[1] = temp # store next number in the sequence in index 1
    end
    fibonacci_sequence[1] # return last number
  end
end

def fibonacci_nonrecursive_old(index)
  fibonacci_sequence = [0,1]
  if fibonacci_sequence[index]
    fibonacci_sequence[index]
  else 
    (index / 2).times do
      fibonacci_sequence[0] = fibonacci_sequence[0] + fibonacci_sequence[1]
      fibonacci_sequence[1] = fibonacci_sequence[0] + fibonacci_sequence[1]
    end
    if index % 2 == 0 # if index is even
      fibonacci_sequence[0]
    else
      fibonacci_sequence[1]
    end
  end
end