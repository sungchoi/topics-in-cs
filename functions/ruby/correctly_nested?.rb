BRACKETS = ["{", "}", "[", "]", "(", ")"]

OPENING_BRACKETS = ["{", "[", "("]
CLOSING_BRACKETS = ["}", "]", ")"]

def correctly_nested?(string)
  stack = []
  string.each_char do |char|
    if OPENING_BRACKETS.include?(char)
      stack.push(char)
    elsif CLOSING_BRACKETS.include?(char)
      return false if !complementary_brackets?([stack.pop, char])
    end
  end

  return false if stack.size > 0

  return true
end

def complementary_brackets?(pair)
  if (pair[0] == "[" && pair[1] == "]") ||
     (pair[0] == "{" && pair[1] == "}") ||
     (pair[0] == "(" && pair[1] == ")")

    return true
  else
    return false
  end

end

# TODO:
# if __FILE__ == $PROGRAM_NAME
#   ARGV
# end

# puts correctly_nested?("") == true
# puts correctly_nested?("[]") == true
# puts correctly_nested?("{}") == true
# puts correctly_nested?("()") == true
# puts correctly_nested?("((") == false
# puts correctly_nested?("{}}") == false
# puts correctly_nested?("{[]}") == true
# puts correctly_nested?("{[}]") == false