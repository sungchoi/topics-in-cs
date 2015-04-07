require_relative 'least_sum_contiguous_subarray'

require 'rspec'

describe "least_sum_contiguous_subarray" do
  it "returns the range of indexes of the array with the least sum" do
    array_zero   = []
    array_one    = [1,2]
    array_two    = [1,2,3]
    array_three  = [-1, -8, 10]
    array_four   = [10, 5, -5, 20]
    expect(least_sum_contiguous_subarray(array_zero)).to  eq((0...0))
    expect(least_sum_contiguous_subarray(array_one)).to   eq((0...0))
    expect(least_sum_contiguous_subarray(array_two)).to   eq((0...0))
    expect(least_sum_contiguous_subarray(array_three)).to eq((0...2))
    expect(least_sum_contiguous_subarray(array_four)).to  eq((2...3))
  end
end
