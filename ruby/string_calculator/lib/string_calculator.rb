module StringCalculator
  def self.add(numbers)
    numbers = '0' if numbers.empty?
    numbers.split(',').map(&:to_i).reduce(:+)
  end
end