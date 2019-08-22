#Problem 1: 

def sum_recur(array)
  return array.first if array.length == 1
  array.last + sum_recur(array[0...-1])
end

#Problem 2: 

def includes?(array, target)
end

# Problem 3: 

def num_occur(array, target)
end

# Problem 4: 

def add_to_twelve?(array)
end

# Problem 5: 

def sorted?(array)
end

# Problem 6: 

def reverse(string)
end

p sum_recur([1, 2, 3, 4, 5])