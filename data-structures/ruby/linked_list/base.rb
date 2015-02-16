require_relative 'empty'
require_relative 'node'
require_relative 'linked_list_node'

module LinkedList
  class Base

    class UnderflowError < StandardError
    end

    include LinkedList
    include Enumerable

    attr_reader :head, :tail, :length

    def initialize()
      empty = LinkedList::Empty.new()
      @head = empty
      @tail = empty
      @length = 0
    end

    def calculate_length
      length = 0
      placeholder = @head
      until placeholder.is_a?(LinkedList::Empty) do
        length += 1
        placeholder = placeholder.next
      end
      length
    end

    def find_tail
      placeholder = @head
      if placeholder.is_a?(LinkedList::Empty)
        @head
      else
        until placeholder.next.is_a?(LinkedList::Empty) do
          placeholder.next
        end
        placeholder
      end
    end

    def each(&block)
      placeholder = @head
      until placeholder.is_a?(LinkedList::Empty) do
        block.call(placeholder.value)
        placeholder = placeholder.next
      end

      self
    end

    def shift
      head = @head
      @head = @head.next
      @length -= 1
      head.value
    end

    def unshift(value)
      node = LinkedListNode(value, @head)
      if @head.is_a?(Empty)
        @head = node
        @tail = node
      else
        @head = node
      end

      @length += 1

      self
    end

    def insert
      #TODO
    end

    def peek
      @head.value
    end

    def empty?
      @head.is_a?(LinkedList::Empty)
    end

    def ==(other)
      return false if !other.instance_of?(self.class) || length != other.length
      placeholder_one = head
      placeholder_two = other.head
      while !placeholder_one.is_a?(LinkedList::Empty)
        return false if placeholder_one.value != placeholder_two.value
        placeholder_one = placeholder_one.next
        placeholder_two = placeholder_two.next
      end

      return true
    end

  end
end
