require_relative "../combinations_of_ways_to_score"

require 'rspec'

describe "combinations_of_ways_to_score" do
  it "should return 1 given a total score of 0" do
    expect(combinations_of_ways_to_score(0)).to eq(1)
  end

  it "" do
    expect(combinations_of_ways_to_score(100, [100])).to eq(1)
    expect(combinations_of_ways_to_score(2, [2, 3])).to eq(1)
    expect(combinations_of_ways_to_score(12, [6, 12])).to eq(2)
    expect(combinations_of_ways_to_score(2, [6, 12])).to eq(0)
    expect(combinations_of_ways_to_score(2, [3, 12])).to eq(0)
  end

end
