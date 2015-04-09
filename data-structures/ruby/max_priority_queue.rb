require_relative 'max_heap'


class MaxPriorityQueue

  def initialize
    @max_heap = MaxHeap.new
  end

  def dequeue
    task = @max_heap.peek.value
    @max_heap.delete!
    task
  end

  def enqueue(priority_level, task)
    @max_heap.insert!([priority_level, task])
    self
  end

  def peek
    @max_heap.peek
  end

end
