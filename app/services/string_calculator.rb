class StringCalculator
  def self.add(numbers)
    return 0 if numbers.strip.empty?

    numbers.split(/,|\n/).map(&:to_i).sum
  end
end