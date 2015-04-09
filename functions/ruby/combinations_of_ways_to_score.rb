def combinations_of_ways_to_score(total_score, ways_to_score = [])
  #assume the total score and all ways to score are integers
  combination_counts    = Array.new(total_score + 1, 0)
  combination_counts[0] = 1
  ways_to_score = ways_to_score.sort

  ways_to_score.each do |way|
    way.upto(total_score) do |i|
      combination_counts[i] += combination_counts[i - way]
    end
  end

  combination_counts[total_score]
end
