def range(startnum, endnum)
  return [] if startnum >= endnum
  [startnum] + range((startnum + 1), endnum)
end

def sum_of_array_recursive(array)
  return array.first if array.length <= 1
  array.first + sum_of_array_recursive(array[1..-1])
end

def sum_of_array_iterative(array)
  sum = 0
  array.each { |num| sum += num }
  sum
end

arr = [1, 2, 3, 4, 5, 6, 7]
p sum_of_array_recursive(arr)
p sum_of_array_iterative(arr)