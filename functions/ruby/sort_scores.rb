def sort_scores(scores, max_score)
  score_counts = Array.new(max_score + 1, 0)
  sorted_scores = []

  scores.each do |score|
    score_counts[score] += 1
  end

  score_counts.each_with_index do |count, index|
    count.times { sorted_scores << index }
  end

  sorted_scores
end
