require 'rspec'
require_relative "permutations.rb"

describe "permutations" do
  it "should return the original array as the only possible permutation given any array of length 1" do
    num = rand(1000)
    expect(permutations([num])).to eq [[num]]
  end

  it "should return all possible permutations of a set (or other enumerable)" do
    expect(permutations([1,2]).sort).to eq [[1,2],[2,1]].sort
    expect(permutations([1,2,3]).sort).to eq [[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2], [3,2,1]].sort
    expect(permutations([1,2,3,4]).sort).to eq [1,2,3,4].permutation(4).to_a.sort
  end

end