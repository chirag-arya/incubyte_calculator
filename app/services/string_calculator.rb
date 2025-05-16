class StringCalculator
  def self.add(numbers)
    return 0 if numbers.strip.empty?

    delimiter = /,|\n/

    if numbers.start_with?("//")
      header, numbers = numbers.split("\n", 2)
      delimiter = Regexp.escape(header[2])
    end

    number_list = numbers.split(/#{delimiter}/).map(&:to_i)

    negatives = number_list.select { |n| n < 0 }
    unless negatives.empty?
      raise ArgumentError, "negative numbers not allowed: #{negatives.join(',')}"
    end

    number_list.sum
  end
end
