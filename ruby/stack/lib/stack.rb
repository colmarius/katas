class Stack
  attr_reader :size

  def initialize
    @size = 0
  end

  def empty?
    @size == 0
  end

  def push(element)
    @size += 1
  end
end
