# @return [nil]
def crackle_pop_100
  puts_crackle_pop_each((1..100))
  nil
end

# @param [Enumerable<Integer>] enumerable
# @return [Enumerable<Integer>]
def puts_crackle_pop_each(enumerable)
  enumerable.each { |i| puts "#{i} => #{crackle_pop(i)}" }
end

# @param [Integer] i
# @return [String]
def crackle_pop(i)
    if divisible_by_15?(i)
      "CracklePop"
    elsif divisible_by_5?(i)
      "Pop"
    elsif divisible_by_3?(i)
      "Crackle"
    else
      i.to_s
    end
end

# @param [Integer] i
# @return [Boolean]
def divisible_by_15?(i)
  i % 15 == 0
end

# @param [Integer] i
# @return [Boolean]
def divisible_by_5?(i)
  i % 5 == 0
end

# @param [Integer] i
# @return [Boolean]
def divisible_by_3?(i)
  i % 3 == 0
end

# CommandLine App
# provides ability run crackle_pop_100
# or optionally one or more integers via command line
# e.g. ruby ./crackle_pop.rb
# e.g. ruby ./crackle_pop.rb 1 2 3 4 5 6 7
if __FILE__ == $PROGRAM_NAME
  if ARGV.empty?
    crackle_pop_100
  else
    puts_crackle_pop_each(ARGV.map(&:to_i))
  end
end

# Tests
# Normally would live in its own file: crackle_pop_spec.rb
require 'rspec'
require 'prime'

RSpec.describe "crackle_pop" do
  context "an integer argument divisible by 15" do
    it "returns 'CracklePop'" do
      expect(crackle_pop((rand(100) + 1) *15)).to eq("CracklePop")
    end
  end

  context "an integer argument divisible by 5" do
    it "returns 'Pop'" do
      expect(crackle_pop((rand(1) + 1) *5)).to eq("Pop")
    end
  end

  context "an integer argument divisible by 3" do
    it "returns 'Crackle'" do
      expect(crackle_pop((rand(3) + 1) *3)).to eq("Crackle")
    end
  end

  context "an integer argument not divisible by 15, 5 or 3" do
    it "should return the integer as a string" do
      expect(crackle_pop(97)).to eq("97")
      expect(crackle_pop(2)).to eq("2")
      expect(crackle_pop(1)).to eq("1")
    end
  end
end

RSpec.describe "divisible_by_15?" do
  it "returns true for integers divisible by 15" do
    expect(divisible_by_15?((rand(100) + 1) * 15)).to eq(true)
  end

  it "returns false for integers not divisible by 15" do
    expect(divisible_by_15?(1)).to eq(false)
    Prime.each(5) do |prime|
      expect(divisible_by_15?(prime)).to eq(false)
    end
  end
end

RSpec.describe "divisible_by_5?" do
  it "returns true for integers divisible by 5" do
    expect(divisible_by_5?((rand(100) + 1) * 5)).to eq(true)
  end

  it "returns false for integers not divisible by 5" do
    expect(divisible_by_5?(1)).to eq (false)
  end
end

RSpec.describe "divisible_by_3?" do
  it "returns true for integers divisible by 3" do
    expect(divisible_by_3?((rand(100) + 1) * 3)).to eq(true)
  end

  it "returns false for integers not divisible by 3" do
    expect(divisible_by_3?(1)).to eq(false)
  end
end
