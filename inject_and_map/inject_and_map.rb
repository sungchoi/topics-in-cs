class Array # (Re)writing in class Array, a part of core ruby, is monkey patching and is not a good practice. This is for conceptual purposes only.

  # A rewrite of ruby inject using ruby
  def new_inject(initial = nil)
    result = initial
    self.each do |item|
      result = yield(result, item)
    end
    result
  end

  def new_map
    # This is the way to understand map and collect theoretically
      # i.e. as a specific use of inject.
    # This is also generally a better way to write map and collect.
    # Ruby only uses the type of method described in new_collect for performance gains.
    # The main difference between collect and inject is that collect returns an array and inject returns the last value.
    # Collect does this by shoveling the return value of inject after each iteration.

    self.inject([]) do |result, item|
      result << yield(item)
    end
  end

  def new_collect
    # Conceptually, this is how ruby actually executes the collect and map methods in order to get the best performance.
    # Notice how similar it is to new_inject.
    # The main difference is that the result of new_collect is an array.

    result = []
    self.each do |item|
      result << yield(item)
    end
    result
  end

end

# Additional notes on keyword yield and blocs:
# item represents the same thing in both new_inject and in new_map.

# When using the keyword yield, the method automatically expects a block and thus it does not need to be specified as an argument in the method definition.
# Use &block_name when specifying blocks as arguments.

# & denotes a block, * denotes an optional parameter.
# The & and * are only necessary to specify what kind of argument a variable is.
# They can be omitted afterwards leaving just the argument name
# When both * and & are being used, & should come after *
# Blocks denoted with an & can be used by calling them. &my_block can be used like such: my_block.call

# Blocks are instances of Procs. But in order to have a block's class be a Proc, one must specify it.
# Use the following notionation bloc = Proc.new{}
# This makes bloc an object that is explicitly an instance of the Proc class

# Blocs do not care about having the right number of arguments.
# It will just use nil for missing arguments
# Lambdas DO care about having the right number of arguments
# They will return an error if you do not provide the correct number of arguments

# Sunday June 17, 2012. Sung Choi. During DevBootCamp
# Updated on December 31, 2012