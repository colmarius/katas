class Stack
  Overflow = Class.new(RuntimeError)
  Underflow = Class.new(RuntimeError)

  attr_reader :size, :capacity

  def initialize(capacity)
    @size = 0
    @capacity = capacity
  end
  private_class_method :new

  def empty?
    @size == 0
  end

  def push(element)
    raise Overflow.new if size == capacity
    @size += 1
  end

  def pop
    raise Underflow.new if size == 0
    @size -= 1
  end

  def self.make(capacity)
    new(capacity)
  end
end
