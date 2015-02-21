module StringCalculator
  NegativesNotAllowed = Class.new(RuntimeError)

  def self.add(numbers_string)
    numbers_string = '0' if numbers_string.empty?
    delimiter = delimiter_regex(numbers_string)
    numbers = numbers_string.split(delimiter).map(&:to_i)
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
end
