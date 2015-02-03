module Tree

  class Node

    def initialize(value, children = nil, parent = nil)
      @value = value
      @children = children
      @parent = parent

      @next
      @prev
    end

    def root?
      @parent.nil?
    end

    # @return [Node]
    def head_child
      if @children
        @children.head #@children.head.value
      else
        nil
      end
    end

    # @param [Node] node
    def head_child=(node)
      @children.prepend(node)
    end

    # @param [Node] node
    def append_child(node)
      if @children.nil?
        @children = DoublyLinkedList::Base.new(node) #wrapper with head and tail?
      else
        @children = @children.append(node)
      end
    end

    # @param [Node] node
    def prepend_child(node)
      if @children.nil?
        @children = DoublyLinkedList::Base.new(node)
      else
        @children = @children.prepend(node)
      end
    end

    # @param [Enumerable<Node>] children
    def prepend_children(children)
      children.length.times { prepend_child(children.pop) }
    end

    # @param [Enumerable<Node>] children
    def append_children(children)
      children.each { | child | append_child(child) }
    end

  end

end
