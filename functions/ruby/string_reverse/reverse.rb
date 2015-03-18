def reverse!(string)
    2.upto(string.length) do |i|
        string.concat(string.slice!(-i))
    end
  string
end

# reverse a string in place
# constraints:
# cannot use the builtin method reverse
# must keep memory usage to n