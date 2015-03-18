# 1. Write a function that takes in an amount of money and denominations and returns the number of ways to arrive at the amount with those denominations.
#order does not matter
def combinationsOfMoney(amount, denominations = [0.01, 0.05, 0.1, 0.25, 0.5, 1.0, 1, 2, 5, 10, 20, 50, 100], memo = [])
  denominations = denominations.sort
  quotient = amount / denominations[-1]
  puts "amount: #{amount}. denominations: #{denominations}. memo: #{memo}. quotient: #{quotient}"

  if denominations.length == 0
    return memo
  elsif denominations.length == 1
    # memo if quotient == 0
    memo.push({denominations[-1] => quotient})
  else
    denom = denominations.pop
    0.upto(quotient) do |i|
      puts "i: #{i}"
      puts "denom: #{denom}"
      puts "denominations: #{denominations}"
      puts "memo: #{memo}"

      combinationsOfMoney(amount - i * denom, denominations).each do |combination|
          puts "combination: #{combination}"
          memo << {denom => i}.merge(combination)
          puts "memo: #{memo}"
      end
    end
  end

  return memo.select do |hash|
    hash.map { |k, v| k * v }
        .reduce(:+) == amount 
  end
end

# replace denominations.pop with a non destructive assignment
# floating point issue

require 'rspec'

RSpec.describe "combinationsOfMoney" do
  it "" do
    expect(combinationsOfMoney(100, [100])).to eq([{100 => 1}])
  end

  it "" do
    expect(combinationsOfMoney(99, [100])).to eq([])
  end

  it "" do
    expect(combinationsOfMoney(100, [1, 100])).to eq([{100 => 0, 1 => 100}, {100 => 1, 1 => 0}])
  end

    it "" do
    expect(combinationsOfMoney(99, [1, 100])).to eq([{100 => 0, 1 => 99}])
  end
end