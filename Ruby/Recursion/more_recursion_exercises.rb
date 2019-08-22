#Problem 1: 

def sum_recur(array)
  return array.first if array.length == 1
  array.last + sum_recur(array[0...-1])
end

#Problem 2: 

def includes?(array, target)
  return true if array.last == target
  return false if array.empty?
  includes?(array[0...-1], target)
end

# Problem 3: 

def num_occur(array, target)
  if array.length == 1
    array.last == target ? val = 1 : val = 0
    return val
  end
  array.last == target ? 1 + num_occur(array[0...-1], target) : 0 + num_occur(array[0...-1], target)
end

# p num_occur([1, 234, 12, 235, 3, 2, 12, 342, 33, 523, 12, 332, 23, 12, 2, 3, 12, 4, 5], 12) # => 5
# p num_occur([19, 21, 1, 4, 18, 13, 6, 12, 22, 18, 21, 3, 24, 11, 9, 20, 20, 25, 3, 17, 18, 25, 24, 16, 8, 19, 18, 15, 22, 24, 11, 2, 10, 9, 24, 7, 7, 20, 1, 3, 10, 13, 21, 20, 15, 21, 2, 2, 10, 4, 22, 5, 17, 20, 22, 2, 5, 1, 4, 25, 5, 12, 9, 2, 23, 10, 5, 13, 15, 7, 19, 2, 1, 6, 5, 22, 22, 2, 10, 8, 4, 8, 9, 13, 23, 10, 22, 18, 15, 6, 20, 7, 22, 3, 9, 11, 8, 9, 11, 19], 13)

# Problem 4: 

def add_to_twelve?(array)
end

# Problem 5: 

def sorted?(array)
end

# Problem 6: 

def reverse(string)
end