require_relative "../knapsack_max_value"

require "rspec"
require "set"

Item = Struct.new(:value, :weight, :name)

describe "knapsack_max_value" do
  let(:items) {
    [
      Item.new(65,  20, "A"),
      Item.new(35,  8,  "B"),
      Item.new(245, 60, "C"),
      Item.new(195, 55, "D"),
      Item.new(65,  40, "E"),
      Item.new(150, 70, "F"),
      Item.new(275, 85, "G"),
      Item.new(155, 25, "H"),
      Item.new(120, 30, "I"),
      Item.new(320, 65, "J"),
      Item.new(75,  75, "K"),
      Item.new(40,  10, "L"),
      Item.new(200, 95, "M"),
      Item.new(100, 50, "N"),
      Item.new(220, 40, "O"),
      Item.new(99,  10, "P")
    ]
  }

  it "should return 0 when no items are given" do
    expect(knapsack_max_value(100, [])).to eq(0)
  end

  it "should return 0 when a sack_size of 0 is given" do
    expect(knapsack_max_value(0, [])).to eq (0)
    expect(knapsack_max_value(0, [Item.new(100, 100), Item.new(50, 75)])).to eq(0)
  end

  it "should return the maximum value possible with the given a certain sack_size" do
    expect(knapsack_max_value(130, items)).to eq(155 + 320 + 220)
    expect(knapsack_max_value(100, [Item.new(100, 100), Item.new(50, 50)])).to eq(100)
    expect(knapsack_max_value(100, [Item.new(200, 10), Item.new(300, 110), Item.new(150, 50)])).to eq(350)
  end
end
