class Stack
  IllegalCapacity = Class.new(RuntimeError)
  Overflow = Class.new(RuntimeError)
  Underflow = Class.new(RuntimeError)

  attr_reader :size, :capacity

  def initialize(capacity)
    @size = 0
    @capacity = capacity
    @elements = Array.new(capacity)
  end
  private_class_method :new

  def empty?
    @size == 0
  end

  def push(element)
    raise Overflow.new if size == capacity
    @elements[@size] = element
    @size += 1
    nil
  end

  def pop
    raise Underflow.new if size == 0
    @size -= 1
    @elements[@size]
  end

  def self.make(capacity)
    raise IllegalCapacity.new if capacity < 0
    new(capacity)
  end
end
