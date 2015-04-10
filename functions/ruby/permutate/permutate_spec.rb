require 'rspec'
require_relative "permutate.rb"

describe "permutate" do
  it "returns an array containing the single possible permutation for any array of length 1: itself" do
    num = rand(1000)
    expect(permutate([num])).to eq [[num]]
  end

  it "should return all possible permutations of a set (or other type of enumerable)" do
    expect(permutate([1,2])).to eq [[1,2],[2,1]]
    expect(permutate([1,2,3])).to eq [[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2], [3,2,1]]
    expect(permutate([1,2,3,4])).to eq [1,2,3,4].permutation(4).to_a
  end

end