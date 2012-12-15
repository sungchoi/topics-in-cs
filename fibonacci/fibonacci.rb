require_relative '../memoizer/memoizer.rb'

class Fib
  extend Memoizer

  def recursive(index)
     if index == 0 || index == 1
       index
     else
       recursive(index - 1) + recursive(index - 2)
     end
   end
   
   def recursive_with_dp(index)
     fibonacci_sequence = [0,1]
     if fibonacci_sequence[index]
       fibonacci_sequence[index]
     else
       fibonacci_sequence[index] = recursive_with_dp(index - 1) + recursive_with_dp(index - 2)
     end
   end
   
   memoize :recursive_with_dp # memoization, aka dynamic processing, caches the result of each recursive calculation so that redundant calculations are not carried out
   
   def nonrecursive(index) 
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
   
   def nonrecursive_old(index)
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

end