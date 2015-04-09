require_relative '../least_sum_contiguous_subarray_circular'

require 'rspec'

describe "least_sum_contiguous_subarray_circular" do
  it "should return an empty range (0...0) for empty arrays" do
    array_zero   = []
    expect(least_sum_contiguous_subarray_circular(array_zero)).to  eq((0...0))
  end

  it "should return the range for the smallest number given an array with only positive integers" do
    array_one    = [1, 2, 3]
    array_two    = [3, 2, 1]
    array_three  = [3, 1, 2]
    expect(least_sum_contiguous_subarray_circular(array_one)).to   eq((0...1))
    expect(least_sum_contiguous_subarray_circular(array_two)).to   eq((2...3))
    expect(least_sum_contiguous_subarray_circular(array_three)).to eq((1...2))
  end

  it "should return the range of indexes of the array with the least sum for a circular array" do
    array_three  = [-1, -8, 10, -10]
    array_four   = [-10, 10, 5, -5, 20, -5]
    array_five   = [-10, 10, -6, 5, -10]
    expect(least_sum_contiguous_subarray_circular(array_three)).to eq((3...6))
    expect(least_sum_contiguous_subarray_circular(array_four)).to  eq((5...7))
    expect(least_sum_contiguous_subarray_circular(array_five)).to  eq((2...6))
  end

  it "should return the range for the entire array when all numbers are negative" do
    array_six = [-1, -2, -3]
    expect(least_sum_contiguous_subarray_circular(array_six)).to eq((0...3))
  end

end
