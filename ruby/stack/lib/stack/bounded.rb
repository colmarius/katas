module Stack
  class Bounded
    attr_reader :size, :capacity

    def initialize(capacity)
      @size = 0
      @capacity = capacity
      @elements = Array.new(capacity)
    end

    def empty?
      size == 0
    end

    def push(element)
      raise Overflow.new if size == capacity
      @elements[size] = element
      @size += 1
      nil
    end

    def pop
      raise Underflow.new if empty?
      @size -= 1
      @elements[@size]
    end

    def top
      raise Empty.new if empty?
      @elements[size - 1]
    end

    def find(element)
      stack_top = (size - 1)
      stack_top.downto(0) do |i|
        return stack_top - i if @elements[i] == element
      end
      nil
    end
  end
end
