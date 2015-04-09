require_relative '../greatest_sum_contiguous_subarray'

require 'rspec'

describe "greatest_sum_contiguous_subarray" do
  it "should return the empty range (0...0) when the array is empty" do
    array_zero   = []
    expect(greatest_sum_contiguous_subarray(array_zero)).to  eq((0...0))
  end

  it "should return the range of indexes of the array with the greatest sum" do
    array_one    = [1,2]
    array_two    = [1,2,3]
    array_three  = [-1, -8, 10]
    array_four   = [10, 5, -5, 20]
    expect(greatest_sum_contiguous_subarray(array_one)).to   eq((0...2))
    expect(greatest_sum_contiguous_subarray(array_two)).to   eq((0...3))
    expect(greatest_sum_contiguous_subarray(array_three)).to eq((2...3))
    expect(greatest_sum_contiguous_subarray(array_four)).to  eq((0...4))
  end

  it "should return the shorter of the two ranges if the edge of the subarray sums to 0" do
    array_one = [12, -12, 3, 4, 65, -78]
    expect(greatest_sum_contiguous_subarray(array_one)).to   eq((2...5))
  end

  it "should return the largest negative number when only negative numbers are in the array" do
    array_one   = [-1, -2, -3]
    array_two   = [-3, -2, -1]
    array_three = [-3, -1, -2]
    expect(greatest_sum_contiguous_subarray(array_one)).to   eq((0...1))
    expect(greatest_sum_contiguous_subarray(array_two)).to   eq((2...3))
    expect(greatest_sum_contiguous_subarray(array_three)).to eq((1...2))
  end
end
