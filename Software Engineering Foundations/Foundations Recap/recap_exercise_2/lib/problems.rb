# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple 
# of both of the given numbers
def least_common_multiple(num_1, num_2)
  i = 1
  i += 1 until i % num_1 == 0 && i % num_2 == 0
  return i
end

# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
  bigrams = []
  (0...(str.length-1)).each do |idx|
    bigrams << str[idx] + str[idx + 1]
  end
  most_frequent = ""
  i = 0
  bigrams.each do |bigram|
    if bigrams.count(bigram) > i
      most_frequent = bigram
      i = bigrams.count(bigram)
    end
  end
  most_frequent
end

class Hash
  # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
  def inverse
    inverted = {}
    self.each { |k, v| inverted[v] = k }
    inverted
  end
end


class Array
  # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
  def pair_sum_count(num)
    pairs = 0
    (0...self.length-1).each do |idx_1|
      (idx_1..self.length-1).each do |idx_2|
        if self[idx_1] + self[idx_2] == num
          pairs += 1
        end
      end
    end
    pairs
  end


  # Write a method, Array#bubble_sort, that takes in an optional proc argument.
  # When given a proc, the method should sort the array according to the proc.
  # When no proc is given, the method should sort the array in increasing order.
  def bubble_sort(&prc)
    prc ||= Proc.new { |a, b| a <=> b }
    sorted = false
    while !sorted
      sorted = true
      (0...self.length-1).each do |idx|
        if prc.call(self[idx], self[idx + 1]) == 1
          self[idx], self[idx+1] = self[idx+1], self[idx]
          sorted = false
        end
      end
    end
    self
  end

end

p [4, 12, 2, 8, 1, 14, 9, 25, 24, 81].bubble_sort #=> [1, 2, 4, 8, 9, 12, 14, 24, 25, 81]