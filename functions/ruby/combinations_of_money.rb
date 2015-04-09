require 'bigdecimal'
require 'bigdecimal/util'

def combinations_of_money(amount, denominations = [0.01, 0.05, 0.1, 0.25, 0.5, 1.0, 1, 2, 5, 10, 20, 50, 100], memo = [])
  amount = amount.to_d
  denominations = denominations.sort.map { |e| e.to_d }
  quotient = amount / denominations[-1]

  if denominations.length == 0
    return memo
  elsif denominations.length == 1
    return memo if amount % denominations[-1] != 0
    memo.push({denominations[-1] => quotient})
  else
    denom = denominations[-1]
    denominations = denominations[0..-2]
    0.upto(quotient) do |i|
      combinations_of_money(amount - i * denom, denominations).each do |combination|
          memo << {denom => i}.merge(combination)
      end
    end
  end

  return memo.select do |hash|
    hash.map { |k, v| k * v }
        .reduce(:+) == amount 
  end
end
