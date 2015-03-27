module NTree

    # def initialize(value, parent = nil)
    #   @value = value
    #   @parent = parent
    #   @first_child
    #   @last_child
    # end

    def root?
      @parent.nil?
    end

    def has_children?
      @first_child
    end

    def first_child?
      !@prev
    end

    def last_child?
      !@next
    end

    def first_child
      @first_child
    end

    # @param [*] value
    def first_child=(value)
      prepend(value)
    end

    def last_child
      @last_child
    end

    def last_child=(child)
      append(child)
    end

    def append_child(child)
      append(child)
    end

    def append_sibling(sibling)
      if @parent
        @parent.append(sibling)
      else
        @next = sibling
        sibling.prev = self
      end
    end

    def prepend_sibling(sibling)
      if @parent
        @parent.prepend(sibling)
      else
        @prev = sibling
        sibling.next = self
      end
    end

    # @param [NTree]
    def prepend(link)
      if empty?
        @head = link
        @tail = link
        @next = nil
        @prev = nil
      else
        old_head = @head
        @head = link
        link.next = old_head
        old_head.prev = link
      end
    end

    def append(value)
      if empty?
        @head = link
        @tail = link
        @next = nil
        @prev = nil
      else
        old_tail = @tail
        @tail = link
        old_tail.next = link
        link.prev = old_tail
      end
    end

    def insert(link, index)
      case index
      when 0
        prepend(value)
      when -1
        append(value)
      elsif index < -1

        # (length - 1)times do
        #
      else #positive
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
