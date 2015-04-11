require_relative "../combinations_of_money_recursive"

require 'rspec'
require 'bigdecimal'
require 'bigdecimal/util'

describe "combinations_of_money_recursive" do
  it "should return an empty array when no combinations are possible" do
    expect(combinations_of_money_recursive(99, [100])).to eq([])
  end

  it "" do
    expect(combinations_of_money_recursive(100, [100])).to eq([{100.to_d => 1.to_d}])
  end



  it "" do
    expect(combinations_of_money_recursive(100, [1, 100])).to eq([{100.to_d => 0.to_d, 1.to_d => 100.to_d}, {100.to_d => 1.to_d, 1.to_d => 0.to_d}])
  end

  it "" do
    expect(combinations_of_money_recursive(99, [1, 100])).to eq([{100.to_d => 0.to_d, 1.to_d => 99.to_d}])
  end
end
