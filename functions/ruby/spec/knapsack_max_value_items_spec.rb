require_relative "../knapsack_max_value_items"

require "rspec"
require "set"

Item = Struct.new(:value, :weight, :name)

describe "knapsack_max_value_items" do
  let(:a) { Item.new(65,  20, "A") }
  let(:b) { Item.new(35,  8,  "B") }
  let(:c) { Item.new(245, 60, "C") }
  let(:d) { Item.new(195, 55, "D") }
  let(:e) { Item.new(65,  40, "E") }
  let(:f) { Item.new(150, 70, "F") }
  let(:g) { Item.new(275, 85, "G") }
  let(:h) { Item.new(155, 25, "H") }
  let(:i) { Item.new(120, 30, "I") }
  let(:j) { Item.new(320, 65, "J") }
  let(:k) { Item.new(75,  75, "K") }
  let(:l) { Item.new(40,  10, "L") }
  let(:m) { Item.new(200, 95, "M") }
  let(:n) { Item.new(100, 50, "N") }
  let(:o) { Item.new(220, 40, "O") }
  let(:p) { Item.new(99,  10, "P") }

  let(:items) { [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p] }

  it "should return an empty array when no items are given" do
    expect(knapsack_max_value_items(100, [])).to eq([])
  end

  it "should return empty array when a sack_size of 0 is given" do
    expect(knapsack_max_value_items(0, [])).to eq ([])
    expect(knapsack_max_value_items(0, [Item.new(100, 100), Item.new(50, 75)])).to eq([])
  end

  it "should return the set of items with the greatest value given a certain sack_size" do
    expect(knapsack_max_value_items(130, items).to_set).to eq(Set.new([h, j, o]))
  end
end
