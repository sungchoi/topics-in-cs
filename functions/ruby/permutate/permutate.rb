#how to write the permutations method from scratch?

def permutate(array) # permutation method using recursion
  if array.length == 1
    [array]
  else
    all = []
    array.each do |element|
      copy = array + []
      element = copy.delete_at(array.index(element))
      permutations = permutate(copy)
      all << permutations.map!{|p| [element].concat([p].flatten(2))}
    end

    all.flatten(1)
  end

end

# example: [3,2,1] ==> [3].concat([2].concat[1]) and [3].concat([1].concat[2]) then [2].concat([3].concat[1]) and [2].concat([1].concat[3]) then [1].concat([2].concat[3]) and [1].concat([3].concat[2])
# or more accurately
# example: [3,2,1] ==> [([2].concat[1]), ([1].concat[2])].map{|p| [3].concat([p])} then [([3].concat[1]), ([1].concat[3])].map{|p| [2].concat([p])} then [([3].concat[2]), ([2].concat[3])].map{|p| [1].concat([p])}
# NOTE: Despite having finished the method, I'm still trying to wrap my head around the manner in which the nesting of arrays occurs

