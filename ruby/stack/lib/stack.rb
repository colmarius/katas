class Stack
  attr_reader :size

  def initialize
    @empty = true
    @size = 0
  end

  def empty?
    @empty
  end
end
