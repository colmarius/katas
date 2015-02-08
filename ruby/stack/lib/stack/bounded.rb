module Stack
  class Bounded
    attr_reader :size, :capacity

    def initialize(capacity)
      @size = 0
      @capacity = capacity
      @elements = Array.new(capacity)
    end

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

    def top
      @elements[@size - 1]
    end
  end
end
