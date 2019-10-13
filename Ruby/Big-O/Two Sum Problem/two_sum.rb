require "byebug"

# Time complexity O(n^2)
# Space complexity O(1)
def bad_two_sum?(arr, target_sum)
  arr.each_with_index do |num1, idx1|
    arr.each_with_index do |num2, idx2|
      unless idx1 == idx2
        return true if num1 + num2 == target_sum
      end
    end
  end
  false
end

#from solutions on a/A site
def okay_two_sum?(arr, target_sum)
  arr = arr.sort
  arr.each_with_index do |el, i|
    match_idx = arr.bsearch_index { |el2| (target_sum - el) <=> el2 }
    return true if match_idx && match_idx != i
  end
  false
end

#from solutions on a/A site
def two_sum?(arr, target_sum)
  debugger
  complements = {}

  arr.each do |el|
    return true if complements[target_sum - el]
    complements[el] = true
  end

  false
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false