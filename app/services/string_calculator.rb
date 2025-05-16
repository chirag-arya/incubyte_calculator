class StringCalculator
  def self.add(numbers)
    return 0 if numbers.strip.empty?

    delimiter = /,|\n| /  # added space as delimiter

    if numbers.start_with?("//")
      header, numbers = numbers.split("\n", 2)
      if header.match?(/\[.+\]/)
        delimiter = header.scan(/\[(.+?)\]/).flatten.map { |d| Regexp.escape(d) }.join('|')
        delimiter = Regexp.new(delimiter)
      else
        delimiter_char = Regexp.escape(header[2])
        delimiter = /#{delimiter_char}/
      end
    end

    values = numbers.split(delimiter).map(&:to_i)

    negatives = values.select(&:negative?)
    raise ArgumentError, "negative numbers not allowed: #{negatives.join(',')}" if negatives.any?

    values.sum
  end
end
