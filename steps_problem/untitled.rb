# A child is running up a staircase with n steps, and can hop either 1 step, 2 steps, or 3 steps at a time. 
# Implement a method to count how many possible ways the child can run up the stairs.

def count_possibilities(num_steps)
  if num_steps < 0 
    0
  elsif num_steps ==0
    1
  else
   count_possibilities(n-1) + count_possibilities(n-2) + count_possibilities(n-3)
  end
end

# NOTE: order matters
# 1
# 
# 1,1
# 2
# 
# 1,1,1
# 1,2
# 2,1  
# 3
# 
# 1,1,1,1
# 1,1,2
# 2,1,1
# 1,2,1
# 2,2
# 3,1
# 1,3
# 
# 1,1,1,1,1
# 1,1,1,2
# 1,1,2,1
# 1,2,1,1
# 2,1,1,1
# 2,2,1
# 1,2,2
# 2,1,2
# 1,1,3
# 1,3,1
# 3,1,1
# 2,3
# 3,2
