require_relative 'node'

module LinkedList
  class Empty < LinkedList::Node

    attr_reader :value

    def initialize
      @value = nil
      @next = nil
    end

    def empty?
      true
    end

  end
end
