module StringCalculator
  NegativesNotAllowed = Class.new(RuntimeError)

  def self.add(numbers_string)
    numbers_string = '0' if numbers_string.empty?
    delimiter = delimiter_regex(numbers_string)
    numbers = numbers_string.split(delimiter).map(&:to_i)
    numbers = filter_numbers(numbers)
    negative_numbers = negative_numbers(numbers)

    if negative_numbers.any?
      raise NegativesNotAllowed.new("Negatives found: #{ negative_numbers.join(',') }")
    else
      numbers.reduce(:+)
    end
  end

  private

  CUSTOM_DELIMITER = /^\/\/(?<delimiter>.)\n.*/

  def self.delimiter_regex(numbers)
    match = numbers.match(CUSTOM_DELIMITER)

    if match
      /#{ Regexp.escape(match['delimiter']) }/
    else
      /,|\n/
    end
  end

  def self.negative_numbers(numbers)
    numbers.select { |number| number < 0 }
  end

  MAX_NUMBER_ALLOWED = 1000

  def self.filter_numbers(numbers)
    numbers.select { |number| number <= MAX_NUMBER_ALLOWED }
  end
end
