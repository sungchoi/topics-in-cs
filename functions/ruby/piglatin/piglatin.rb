def piglatin_word(word)
  word.start_with?("Qu", "qu") ? word.prepend(word.slice!(2..-1)) + "ay" :  word.prepend(word.slice!(/[aeiou]../i)) + "ay"
end