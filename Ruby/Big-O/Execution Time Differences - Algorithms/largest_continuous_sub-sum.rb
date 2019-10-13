require "byebug"

list1 = [5, 3, -7]

def largest_contiguous_subsum(list)
  # debugger
  sub_arrays = []
  list[0..-1].each_with_index do |element, index|
    list[index..-1].each_with_index do |element2, index2|
      sub_arrays << list[index..(index2 + index)]
    end
  end
  sub_arrays.map!(&:sum).max
end

def efficient_subsum(list)
  debugger
  largest = list.first
  current = list.first

  return list.max if list.all? { |num| num < 0 }

  list.drop(1).each do |num|
    current = 0 if current < 0
    current += num
    largest = current if current > largest
  end
  largest
end

p largest_contiguous_subsum(list1) # => 8 (from [7, -6, 7])
# possible sub-sums
# [5]           # => 5
# [5, 3]        # => 8 --> we want this one
# [5, 3, -7]    # => 1
# [3]           # => 3
# [3, -7]       # => -4
# [-7]          # => -7

list2 = [2, 3, -6, 7, -6, 7]
p efficient_subsum(list1) # => 8

list3 = [-5, -1, -3]
p largest_contiguous_subsum(list3) # => -1 (from [-1])

