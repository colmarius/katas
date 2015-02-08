module Stack
  class ZeroCapacity
    def empty?
      true
    end

    def size
      0
    end

    def push(element)
      raise Overflow.new
    end

    def pop
      raise Underflow.new
    end

    def top
      raise Empty.new
    end

    def find(element)
      nil
    end
  end
end
