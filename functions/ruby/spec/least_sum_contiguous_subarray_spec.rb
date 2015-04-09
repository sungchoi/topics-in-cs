require_relative '../least_sum_contiguous_subarray'

require 'rspec'

describe "least_sum_contiguous_subarray" do
  it "should return the empty range (0...0) for an empty array" do
    array_zero   = []
    expect(least_sum_contiguous_subarray(array_zero)).to  eq((0...0))
  end

  it "should return the range for the entire array given an array of only negative numbers" do
    array_one   = [-1, -3, -5]
    array_two   = [-10, -9, -8, -7]
    expect(least_sum_contiguous_subarray(array_one)).to  eq((0...3))
    expect(least_sum_contiguous_subarray(array_two)).to  eq((0...4))
  end

  it "should return the range of indexes of the array with the least sum for an array of both negative and positive numbers" do
    array_three  = [-1, -8, 10]
    array_four   = [10, 5, -5, 20]
    array_five   = [-1, -3, -5]
    expect(least_sum_contiguous_subarray(array_three)).to eq((0...2))
    expect(least_sum_contiguous_subarray(array_four)).to  eq((2...3))
    expect(least_sum_contiguous_subarray(array_five)).to  eq((0...3))
  end

  it "should return the range for the smallest number when all numbers are positive" do
    array_six      = [1,2]
    array_seven    = [1,2,3]
    expect(least_sum_contiguous_subarray(array_six)).to   eq((0...1))
    expect(least_sum_contiguous_subarray(array_seven)).to   eq((0...1))
  end

end
