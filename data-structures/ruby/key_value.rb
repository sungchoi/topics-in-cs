def KeyValue(key, value = nil)
  # NOTE: ruby case statements use ===
  # NOTE: when LinkedList::Node === case value
  # NOTE: LinkedList::Node === value.class #=> LinkedList::Node === Class #=> false
  # NOTE: http://stackoverflow.com/questions/3801469/how-to-catch-errnoeconnreset-class-in-case-when
  case key
  when KeyValue
    key
  when Array
    KeyValue.new(key[0], key[1])
  else
    KeyValue.new(key, value)
  end
end

class KeyValue

  include Comparable
  attr_reader :key, :value

  def initialize(key, value)
    @key   = key
    @value = value
  end

  def <=>(other)
    @key <=> other.key
  end

  def to_a
    [@key, @value]
  end

end
