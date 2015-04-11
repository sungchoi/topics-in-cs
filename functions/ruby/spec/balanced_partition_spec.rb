require_relative "../balanced_partition"

require "rspec"

describe "balanced_partition" do
  it "should return the smaller balanced subset" do
    expect(balanced_partition([50, 50])).to eq([50])
    expect(balanced_partition([20, 25, 30, 50, 75])).to eq([20, 30, 50])
    expect(balanced_partition([1, 2, 3, 4, 5, 6, 7, 8, 9, 0])).to eq([1, 2, 3, 4, 5, 7])
    expect(balanced_partition([1, 2, 3, 4, 5, 5, 6, 7, 8, 9, 0])).to eq([2, 3, 4, 5, 5, 6])
  end
end
