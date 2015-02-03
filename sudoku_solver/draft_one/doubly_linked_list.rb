module DoublyLinkedList

    def initialize(nxt, prev)
      @next = nxt
      @prev = prev
    end

    def empty?
      !@head
    end

    def add(value)
      prepend(value)
    end

    def prepend(value)
      link = self.class.new(value)
      if empty?
        @head = link
        @tail = link
      else
        old_head = @head
        @head = link
        link.next = old_head
        old_head.prev = link
      end
    end

    def append(value)
      link = Link.new(value)
      if empty?
        @head = link
        @tail = link
      else
        old_tail = @tail
        @tail = link
        old_tail.next = link
        link.prev = old_tail
      end
    end

    def insert(value, index)
      link = Link.new(value)
      if index == 0
        prepend(value)
      elsif index == -1
        append(value)
      elsif index < -1
        # (length - 1)times do
        #
      else
        base = @head
        index.times do
          base.next
        end

        link_at_index = base
        link_at_index_prev = link_at_index.prev
        link_at_index.prev = link
        link_at_index_prev.next = link
        link.next = link_at_index
        link.prev = link_at_index_prev
      end
    end

  end

end
