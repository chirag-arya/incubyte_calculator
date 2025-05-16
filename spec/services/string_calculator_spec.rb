require 'rails_helper'

RSpec.describe StringCalculator do
  describe ".add" do

    it "handles any amount of numbers" do
      expect(StringCalculator.add("1,2,3,4,5")).to eq(15)
      expect(StringCalculator.add("10,20,30,40")).to eq(100)
    end

    it "returns 0 for an empty string" do
      expect(described_class.add("")).to eq(0)
    end

    it "returns the number itself if one number is given" do
      expect(described_class.add("1")).to eq(1)
    end

    it "returns the sum of two numbers" do
      expect(described_class.add("1,5")).to eq(6)
    end
  end
end