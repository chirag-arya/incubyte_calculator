class StringCalculator
  def self.add(numbers)
    return 0 if numbers.strip.empty?

    delimiter = /,|\n/

    if numbers.start_with?("//")
      header, numbers = numbers.split("\n", 2)
      delimiter_char = Regexp.escape(header[2])
      delimiter = /#{delimiter_char}/
    end

    values = numbers.split(delimiter).map(&:to_i)

    negatives = values.select { |n| n.negative? }
    raise ArgumentError, "negative numbers not allowed: #{negatives.join(',')}" if negatives.any?

    values.sum
  end
end
