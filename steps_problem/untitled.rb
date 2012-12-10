# A child is running up a staircase with n steps, and can hop either 1 step, 2 steps, or 3 steps at a time. 
# Implement a method to count how many possible ways the child can run up the stairs.

def count_possibilities(num_steps)
  if num_step == 1
    1
  elsif num_step == 2
    2
  elsif num_step == 3
    3
  elsif num_step == 4
    4
  elsif num_step == 5
    5
  elsif num_step == 6
    7
  else
    (num_steps / 6) * 7 + count_possibilities( num_steps % 6)
  end

end

# 1
# 
# 1,1
# 2
# 
# 1,1,1
# 1,2  
# 3
# 
# 1,1,1,1
# 1,1,2
# 2,2
# 3,1
# 
# 1,1,1,1,1
# 1,1,1,2
# 1,2,2
# 1,1,3
# 2,3
# 
# 1,1,1,1,1,1
# 1,1,1,1,2
# 1,1,2,2
# 2,2,2
# 1,1,1,3
# 1,2,3
# 3,3