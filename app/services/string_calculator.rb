class StringCalculator
  def self.add(numbers)
    return 0 if numbers.strip.empty?

    numbers.split(',').map(&:to_i).sum
  end
end