module StringCalculator
  def self.add(numbers)
    numbers = '0' if numbers.empty?
    delimiter = delimiter_regex(numbers)
    numbers.split(delimiter).map(&:to_i).reduce(:+)
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
end
