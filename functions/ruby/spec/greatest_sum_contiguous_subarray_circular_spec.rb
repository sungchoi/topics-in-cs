require_relative '../greatest_sum_contiguous_subarray_circular'

require 'rspec'

describe "greatest_sum_contiguous_subarray_circular" do
  it "should return the empty range (0...0) when given an empty array" do
    array_zero   = []
    expect(greatest_sum_contiguous_subarray_circular(array_zero)).to  eq((0...0))
  end

  it "should return the the entire range of indexes given an array of only positive integers" do
    array_one    = [1,2]
    array_two    = [1,2,3]
    expect(greatest_sum_contiguous_subarray_circular(array_one)).to   eq((0...2))
    expect(greatest_sum_contiguous_subarray_circular(array_two)).to   eq((0...3))
  end

  it "should return the range of indexes of the array with the greatest sum given an array of positive and negative integers" do
    array_three  = [-1, -8, 10]
    array_four   = [10, 5, -5, 20]
    expect(greatest_sum_contiguous_subarray_circular(array_three)).to eq((2...3))
    expect(greatest_sum_contiguous_subarray_circular(array_four)).to  eq((3...6))
  end

  it "should return the largest negative number when only negative numbers are in the array" do
    array_five   = [-1, -2, -3]
    expect(greatest_sum_contiguous_subarray_circular(array_five)).to  eq((0...1))
  end
end
