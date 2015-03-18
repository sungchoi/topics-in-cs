
def mergesort(array)
  return array if array.length == 1
  left = mergesort(array[0..((array.length / 2)-1)])
  right = mergesort(array[((array.length / 2))..-1])
  merge(left, right)
end

def merge(array_one, array_two)
  index_one = 0
  index_two = 0
  result = []
  while index_one < array_one.length && index_two < array_two.length
    if array_one[index_one] < array_two[index_two]
      result << array_one[index_one]
      index_one = index_one + 1
    else
      result << array_two[index_two]
      index_two = index_two + 1
    end
  end

  result + array_one[index_one..-1] + array_two[index_two..-1]
end

def merge_memo(array_one, array_two, memo = [])
  return memo + array_one + array_two if array_one.empty? || array_two.empty?
  left_one, *rest_one = array_one
  left_two, *rest_two = array_two
  if left_one < left_two
    memo = memo << left_one
    array_one = rest_one
  else
    memo = memo << left_two
    array_two = rest_two
  end

  merge_memo(array_one, array_two, memo)
end
