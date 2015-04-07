require_relative 'greatest_sum_contiguous_subarray'

require 'rspec'

describe "greatest_sum_contiguous_subarray" do
  it "returns the range of indexes of the array with the greatest sum" do
    array_zero   = []
    array_one    = [1,2]
    array_two    = [1,2,3]
    array_three  = [-1, -8, 10]
    array_four   = [10, 5, -5, 20]
    array_five   = [-1]
    array_six    = [-1, -2]
    expect(greatest_sum_contiguous_subarray(array_zero)).to  eq((0...0))
    expect(greatest_sum_contiguous_subarray(array_one)).to   eq((0...2))
    expect(greatest_sum_contiguous_subarray(array_two)).to   eq((0...3))
    expect(greatest_sum_contiguous_subarray(array_three)).to eq((2...3))
    expect(greatest_sum_contiguous_subarray(array_four)).to  eq((0...4))
    expect(greatest_sum_contiguous_subarray(array_five)).to  eq((0...1))
    expect(greatest_sum_contiguous_subarray(array_six)).to   eq((0...1))
  end
end
