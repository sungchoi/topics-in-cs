require 'rspec'

require_relative '../expression.rb'

describe SymbolicCalculator::Expression do
  context "#evaluate" do
    it "does addition" do
      left = SymbolicCalculator::Expression.new(Random.new.rand(100))
      right = SymbolicCalculator::Expression.new(Random.new.rand(100))
      total = left.value + right.value
      expect(SymbolicCalculator::Expression.new("+", left, right).evaluate.value).to eq(total)
    end

    it "does subtraction" do
      left  = SymbolicCalculator::Expression.new(Random.new.rand(100))
      right = SymbolicCalculator::Expression.new(Random.new.rand(100))
      total = left.value - right.value
      expect(SymbolicCalculator::Expression.new("-", left, right).evaluate.value).to eq(total)
    end

    it "handles identities" do
      left  = SymbolicCalculator::Expression.new("x")
      right = SymbolicCalculator::Expression.new(0)
      expect(SymbolicCalculator::Expression.new("+", left, right).evaluate.to_s).to eq(left.to_s)
    end

    it "does x x * => x 2 **" do
      left  = SymbolicCalculator::Expression.new("x")
      right = SymbolicCalculator::Expression.new("x")
      expect(SymbolicCalculator::Expression.new("*", left, right).evaluate.to_s).to eq("x 2 **")
    end

    it "does x x * x * => x 3 **" do
      left  = SymbolicCalculator::Expression.new("*", SymbolicCalculator::Expression.new("x"), SymbolicCalculator::Expression.new("x")).evaluate
      right = SymbolicCalculator::Expression.new("x")
      expect(SymbolicCalculator::Expression.new("*", left, right).evaluate.to_s).to eq("x 3 **")
    end

    it "does x x * x / => x 1 **" do
      left  = SymbolicCalculator::Expression.new("*", SymbolicCalculator::Expression.new("x"), SymbolicCalculator::Expression.new("x")).evaluate
      right = SymbolicCalculator::Expression.new("x")
      expect(SymbolicCalculator::Expression.new("/", left, right).evaluate.to_s).to eq("x 1 **")
    end
  end

  context "#do_arithmetic" do
    it "does addition" do
      left = SymbolicCalculator::Expression.new(Random.new.rand(100))
      right = SymbolicCalculator::Expression.new(Random.new.rand(100))
      total = left.value + right.value
      expect(SymbolicCalculator::Expression.new("+", left, right).do_arithmetic.value).to eq(total)
    end
  end
end

describe SymbolicCalculator::ARITHMETIC_TABLE do
  it "does addition" do
    left  = Random.new.rand(100)
    right = Random.new.rand(100)
    total = left + right
    expect(SymbolicCalculator::ARITHMETIC_TABLE["+"].call(left, right)).to eq(total)
    expect(SymbolicCalculator::ARITHMETIC_TABLE["+"].call(2, 2)).to eq(4)
  end

  it "does subtraction" do
    left  = Random.new.rand(100)
    right = Random.new.rand(100)
    total = left - right
    expect(SymbolicCalculator::ARITHMETIC_TABLE["-"].call(left, right)).to eq(total)
    expect(SymbolicCalculator::ARITHMETIC_TABLE["-"].call(2, 2)).to eq(0)
  end

  it "does multiplication" do
    left  = Random.new.rand(100)
    right = Random.new.rand(100)
    total = left * right
    expect(SymbolicCalculator::ARITHMETIC_TABLE["*"].call(left, right)).to eq(total)
    expect(SymbolicCalculator::ARITHMETIC_TABLE["*"].call(2, 2)).to eq(4)
  end

  it "does division" do
    left  = Random.new.rand(100)
    right = Random.new.rand(100)
    total = left / right
    expect(SymbolicCalculator::ARITHMETIC_TABLE["/"].call(left, right)).to eq(total)
    expect(SymbolicCalculator::ARITHMETIC_TABLE["/"].call(4, 2)).to eq(2)
  end
end
