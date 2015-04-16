# A child is running up a staircase with n steps, and can hop either 1 step, 2 steps, or 3 steps at a time. 
# Implement a method to count how many possible ways the child can run up the stairs.
require_relative("../factorial/factorial")


def combinations_of_steps_count(steps, step_types = [1, 2, 3])
  counts = Array.new(steps + 1, 0)
  counts[0] = 1

  step_types.sort.each do |step_type|
    ((step_type)..steps).each do |i|
      puts "i: #{i}, step_type: #{step_type}"
      counts[i] += counts[i - step_type]
    end
  end

  counts[steps]

end


def combinations_of_steps(steps, step_types = [1, 2, 3])


    sets = Array.new(steps + 1, [])
    sets[0] = [[]]
    puts sets.inspect


  step_types.sort
  step_types.each do |step_type|
    puts "step_type: #{step_type}"
    ((step_type)..steps).each do |i|
      puts "i: #{i}"
      puts sets.inspect

        puts "sets[#{i}]: #{sets[i]}"
        puts "sets[#{i - step_type}]: #{sets[i - step_type]}"


        # map = sets[i - step_type].map do |set|
        #   set_size = set.size
        #   puts set.inspect
        #   puts set_size
        #   puts (0...set_size)
        #   puts (set_size...-1)
        #   set + [step_type]
        #   set.each_with_index do |subset, index|
        #     set[index] =
        #   end
        # end
        # puts "map: #{map.inspect}"


        sets[i - step_type].each do |set|
          puts "inside the sets[i - step_type] loop"
          (0..(set.size)).each do |index|
            puts "index: #{index}"
            sets[i] += set[0...index] + [step_type] + set[index..-1]
          end
        end


        puts "sets[#{i - step_type}]: #{sets[i - step_type]}"


        # sets[i] += map

        puts "sets[#{i}]: #{sets[i]}"
        # set[0] = [[]]
        # set[1] = []
        # set[1] [].push([[]].map{ |set| set.push(1)})
    end
  end

  return sets[steps]

end

def combinations_of_steps_top_down(steps)
  if steps < 0
    0
  elsif steps == 0
    1
  else
    combinations_of_steps_top_down(steps - 1) + combinations_of_steps_top_down(steps - 2) + combinations_of_steps_top_down(steps - 3)
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
