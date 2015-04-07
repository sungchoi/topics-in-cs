require_relative 'greatest_sum_contiguous_subarray_circular'

require 'rspec'

describe "greatest_sum_contiguous_subarray_circular" do
  it "returns the range of indexes of the array with the greatest sum for a circular array" do
    array_zero   = []
    array_one    = [1,2]
    array_two    = [1,2,3]
    array_three  = [-1, -8, 10]
    array_four   = [10, 5, -5, 20]
    expect(greatest_sum_contiguous_subarray_circular(array_zero)).to  eq((0...0))
    expect(greatest_sum_contiguous_subarray_circular(array_one)).to   eq((0...2))
    expect(greatest_sum_contiguous_subarray_circular(array_two)).to   eq((0...3))
    expect(greatest_sum_contiguous_subarray_circular(array_three)).to eq((2...3))
    expect(greatest_sum_contiguous_subarray_circular(array_four)).to  eq((3...6))
  end
end
