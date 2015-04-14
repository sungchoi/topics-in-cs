require_relative 'stack'

class MinStack

  def initialize
    @stack     = Stack.new
    @min_stack = Stack.new
  end

  def min
    @min_stack.peek
  end

  def push(value)
    @min_stack.push(value) if @min_stack.empty? || @min_stack.peek <= value
    @stack(value)
  end

  def pop
    @max_stack.pop if peek == @max_stack.peek
    @stack
  end

end
