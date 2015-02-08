require 'stack/bounded'
require 'stack/zero_capacity'

module Stack
  IllegalCapacity = Class.new(RuntimeError)
  Overflow = Class.new(RuntimeError)
  Underflow = Class.new(RuntimeError)

  def self.make(capacity)
    raise IllegalCapacity.new if capacity < 0

    if capacity == 0
      ZeroCapacity.new
    else
      Bounded.new(capacity)
    end
  end
end
