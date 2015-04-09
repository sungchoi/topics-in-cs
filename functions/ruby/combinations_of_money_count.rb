# 1. Write a function that takes in an amount of money and denominations and returns the number of ways to arrive at the amount with those denominations.
#order does not matter

# @return [Integer]
def combinations_of_money_count(amount, denominations = [0.01, 0.05, 0.1, 0.25, 0.5, 1.0, 1, 2, 5, 10, 20, 50, 100], memo = [])
  amount = (amount * 100).to_i
  denominations = denominations.sort.map { |n| (n * 100).to_i }

  combinations_counts = Array.new(amount * 100 + 1, 0)
  combinations_counts[0] = 1

  denominations.each do |denomination|
    denomination.upto(amount) do |i|
      combinations_counts[i] += combinations_counts[i - denomination]
    end
  end

  combinations_counts[amount]
end
