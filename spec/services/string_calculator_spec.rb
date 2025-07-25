require 'rails_helper'

RSpec.describe StringCalculator do
  describe ".add" do

    it "handles any amount of numbers" do
      expect(described_class.add("1,2,3,4,5")).to eq(15)
      expect(described_class.add("10,20,30,40")).to eq(100)
    end

    it "handles newlines between numbers" do
      expect(described_class.add("1\n2,3")).to eq(6)
      expect(described_class.add("4\n5\n6")).to eq(15)
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

    it "supports custom delimiter using //syntax" do
      expect(described_class.add("//;\n1;2")).to eq(3)
      expect(described_class.add("//|\n4|5|6")).to eq(15)
    end

    it "raises an error for negative numbers" do
      expect {
        StringCalculator.add("1,-2,-5,4")
      }.to raise_error(ArgumentError, "negative numbers not allowed: -2,-5")
    end
  end
end