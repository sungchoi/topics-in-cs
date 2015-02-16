require_relative 'doubly_linked_list/base'

class Queue

  class UnderflowError < StandardError
  end

  def initialize()
    @list = DoublyLinkedList::Base.new()
  end

  def enqueue(value)
    @list.unshift(value)

    self
  end

  def dequeue
    return UnderflowError.new("Underflow Error: Queue is empty") if empty?
    @list.remove_from_tail
  end

  def peek
    @list.tail.value
  end

  def empty?
    @list.empty?
  end

  def size
    @list.length
  end

end
