require 'stack/bounded'

module Stack
  IllegalCapacity = Class.new(RuntimeError)
  Overflow = Class.new(RuntimeError)
  Underflow = Class.new(RuntimeError)

  def self.make(capacity)
    raise IllegalCapacity.new if capacity < 0
    Bounded.new(capacity)
  end
end
