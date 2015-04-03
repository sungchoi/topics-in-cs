class LinkedListNode

  def self.append(value)
    LinkedListNode.new(value)
  end

  def self.each
  end

  def self.empty?
    true
  end

  def length
    0
  end

  def self.peek
    nil
  end

  def self.prepend(value)
    LinkedListNode.new(value)
  end

  def self.replace(value)
    LinkedListNode.new(value)
  end

  def self.unshift(value)
    LinkedListNode.new(value)
  end

  def self.shift
    self
  end

  include Enumerable
  attr_reader :value, :next

  def initialize(value, nxt = :__empty__)
    @value = value
    @next  = nxt
  end

  def append(value)
    LinkedListNode.new(value, self)
  end

  def each(&block)
    value = block.call(@value)
    nxt   = @next == :__empty__ ? @next : @next.each(&block)
    LinkedListNode.new(value, nxt)
  end

  def empty?
    false
  end

  def length
    return 1 if @next == :__empty__
    1 + @next.length
  end

  def peek
    @value
  end

  def prepend(value)
    if @next == :__empty__
      LinkedListNode.new(@value, LinkedListNode.new(value))
    else
      LinkedListNode.new(@value, @next.prepend(value))
    end
  end

  def replace(value)
    LinkedListNode.new(value, @next)
  end

  def unshift(value)
    LinkedListNode.new(@value, self)
  end

  def shift
    if @next != :__empty__
      LinkedListNode.new(@next.value, @next.next)
    else
      LinkedListNode
    end
  end

end
