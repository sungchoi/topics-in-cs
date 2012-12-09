require_relative 'factorial.rb'
require 'rspec'

describe '#factorial_loop' do
  it ' ' do
    factorial(3).should eq (3 * 2 * 1)
    factorial(10).should eq (10 * 9 * 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1)
  end
end

describe '#factorial_inject' do
  it ' ' do
    factorial2(3).should eq (3 * 2 * 1)
    factorial2(10).should eq (10 * 9 * 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1)
  end
end