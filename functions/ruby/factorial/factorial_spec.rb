require_relative 'factorial'

require 'rspec'

describe "#factorial" do
  it "should return n! given n" do
    expect(factorial(3)).to eq (6)
    expect(factorial(10)).to eq (3628800)
  end

end

describe "#factorial_loop" do
  it "should return n! given n" do
    expect(factorial_loop(3)).to eq (6)
    expect(factorial_loop(10)).to eq (3628800)
  end

end

describe "#factorial_inject" do
  it "should return n! given n" do
    expect(factorial_inject(3)).to eq (6)
    expect(factorial_inject(10)).to eq (3628800)
  end

end