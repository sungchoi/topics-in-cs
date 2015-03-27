# 1. Write a function that takes in an amount of money and denominations and returns the number of ways to arrive at the amount with those denominations.
#order does not matter

require 'bigdecimal'
require 'bigdecimal/util'

def combinations_of_money(amount, denominations = [0.01, 0.05, 0.1, 0.25, 0.5, 1.0, 1, 2, 5, 10, 20, 50, 100], memo = [])
  amount = amount.to_d
  denominations = denominations.sort.map { |e| e.to_d }
  quotient = amount / denominations[-1]
  puts "amount: #{amount}. denominations: #{denominations}. memo: #{memo}. quotient: #{quotient}"

  if denominations.length == 0
    return memo
  elsif denominations.length == 1
    return memo if amount % denominations[-1] != 0
    memo.push({denominations[-1] => quotient})
  else
    denom = denominations[-1]
    denominations = denominations[0..-2]
    0.upto(quotient) do |i|
      puts "i: #{i}. denom: #{denom}. denominations: #{denominations}. memo: #{memo}"

      combinations_of_money(amount - i * denom, denominations).each do |combination|
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

require 'rspec'
require 'bigdecimal'
require 'bigdecimal/util'

RSpec.describe "combinations_of_money" do
  it "" do
    expect(combinations_of_money(100, [100])).to eq([{100.to_d => 1.to_d}])
  end

  it "" do
    expect(combinations_of_money(99, [100])).to eq([])
  end

  it "" do
    expect(combinations_of_money(100, [1, 100])).to eq([{100.to_d => 0.to_d, 1.to_d => 100.to_d}, {100.to_d => 1.to_d, 1.to_d => 0.to_d}])
  end

  it "" do
    expect(combinations_of_money(99, [1, 100])).to eq([{100.to_d => 0.to_d, 1.to_d => 99.to_d}])
  end
end