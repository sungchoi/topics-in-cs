def anagram?(word1, word2)
  word1.downcase.split("").sort == word2.downcase.split("").sort
end
