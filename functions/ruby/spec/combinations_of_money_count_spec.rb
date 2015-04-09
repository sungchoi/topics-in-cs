require_relative "../combinations_of_money_count"

require 'rspec'

describe "combinations_of_money_count" do
  it "should return one for a sum of 0, i.e. there is one way to make 0" do
    expect(combinations_of_money_count(0, [100])).to eq(1)
    expect(combinations_of_money_count(0, [1, 5, 10])).to eq(1)
  end

  it "should return the correct number of possible cominations to make the amount given a set of denominations" do
    expect(combinations_of_money_count(100, [1, 100])).to eq(2)
    expect(combinations_of_money_count(99, [1, 100])).to eq(1)
    expect(combinations_of_money_count(10, [1, 5, 10])).to eq(4)
  end

  it "should return 1 when there is only one denomination and it is equal to the amount" do
    expect(combinations_of_money_count(100, [100])).to eq(1)
  end

  it "should return 0 when no denominations are less than or equal to the amount" do
    expect(combinations_of_money_count(99, [100])).to eq(0)
  end
end
