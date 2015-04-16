require_relative "factorial/factorial"

def n_chose_k(n, k)
  factorial(n) / factorial(n - k)

  ((n - k)...(n)).reduce(&:*)

end

def n_chose_k_dp(n, k)
  counts_map = Array.new(k + 1, 0)
  counts_map[0] = 1

  (i..n).each do |i|
    [i, k].min.downto(1) do |j|
      counts_map[j] += counts_map[j - 1]
  end

  counts_map[k]

  # n_chose_k_dp(n, k) = n_chose_k_dp(n - 1, k) + n_chose_k_dp(n - 1, k - 1)
end