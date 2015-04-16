require_relative("combinations_of_steps")
require "rspec"

describe "combinations_of_steps" do
  it "should return 1 as the number of combinations when given a total of 0 steps" do
    expect(combinations_of_steps(0)).to eq(1)
  end

  it "should return 1 as the number of combinations of steps given a total of 1 steps" do
    expect(combinations_of_steps(1)).to eq(1)
  end

  it "" do
    expect(combinations_of_steps(2)).to eq(2)
    expect(combinations_of_steps(3)).to eq(4)
    expect(combinations_of_steps(4)).to eq(7)
  end
end
