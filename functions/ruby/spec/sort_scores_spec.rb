require_relative "../sort_scores"

require "rspec"

describe "sort_scores(scores, max_score)" do
  it "should return a new array of sorted scores given a collection of positive integer scores" do
    expect(sort_scores([10, 8], 100)).to eq([8, 10])
    expect(sort_scores([8, 8, 8], 100)).to eq([8, 8, 8])
    expect(sort_scores([1, 100, 10, 88, 69, 92, 40, 77, 6], 100)).to eq([1, 6, 10, 40, 69, 77, 88, 92, 100])
  end

end
