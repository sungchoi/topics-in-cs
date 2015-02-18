require_relative 'doubly_linked_list_node'

module DoublyLinkedList
  class Node

    attr_reader :value
    attr_accessor :prev, :next

    def initialize(value, nxt = nil, prev = nil)
      @value = value
      @next = nxt
      @prev = prev
    end

    def insert_after(value)
      #TODO
    end

    def insert_before(value)
      #TODO
    end

    def empty?
      false
    end

  end
end
