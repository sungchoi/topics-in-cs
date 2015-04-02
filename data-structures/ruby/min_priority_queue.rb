require_relative 'min_heap'

class MinPriorityQueue

  def initialize
    @min_heap = MinHeap.new
  end

  def enqueue(priority_level, task)
    @min_heap.insert!([priority_level, task])
  end

  def dequeue
    task = @min_heap.peek.value
    @min_heap.delete!
    task
  end
end
