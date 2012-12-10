# A child is running up a staircase with n steps, and can hop either 1 step, 2 steps, or 3 steps at a time. 
# Implement a method to count how many possible ways the child can run up the stairs.

def count_possibilities(num_steps)
  case num_steps
  when 1
    1
  when 2
    2
  when 3
    3
  when 4
    4
  when 5
    5
  when 6
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