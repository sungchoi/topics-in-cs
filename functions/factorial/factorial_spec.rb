require_relative 'factorial.rb'
require 'rspec'

describe '#factorial_loop' do
  it ' ' do
    factorial_loop(3).should eq (3 * 2 * 1)
    factorial_loop(10).should eq (10 * 9 * 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1)
  end
end

describe '#factorial_inject' do
  it ' ' do
    factorial_inject(3).should eq (3 * 2 * 1)
    factorial_inject(10).should eq (10 * 9 * 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1)
  end
end