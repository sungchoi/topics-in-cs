require 'rspec'
require_relative "permutate.rb"

describe "permutate" do
  it "returns self for any array of length 1" do
    num = rand(1000)
    permutate([num]).should eq [num]
  end
  it "returns all possible permutations of a set" do
    permutate([1,2]).should eq [[1,2],[2,1]]
  end
  it "" do
    permutate([1,2,3]).should eq [[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2], [3,2,1]]
  end
  
  it "" do
    permutate([1,2,3,4]).should eq [1,2,3,4].permutation(4).to_a
  end
end