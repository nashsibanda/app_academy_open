require 'byebug'

class Array

  def my_each(&prc)
    prc ||= Proc.new { |i| return i }
    self.length.times { |index| prc.call(self[index]) }
    self
  end

  def my_select(&prc)
    selected = []
    self.my_each { |element| selected << element if prc.call(element) }
    return selected
  end

  def my_reject(&prc)
    unselected = []
    self.my_each { |element| unselected << element if !prc.call(element) }
    return unselected
  end

  def my_any?(&prc)
    any = false
    self.my_each { |element| any = true if prc.call(element) }
    return any
  end

  def my_all?(&prc)
    all = true
    self.my_each { |element| all = false if !prc.call(element) }
    return all
  end

  def my_flatten
    flattened_arr = []
    self.my_each do |element|
      debugger
      if !element.is_a?(Array)
        flattened_arr << element
      else
        flattened_arr += element.my_flatten
      end
    end
    flattened_arr
  end

  def my_zip(*arrs)
    zipped = Array.new(self.length) {Array.new(0)}
    zipped.each_index do |zip_index|
      zipped[zip_index] << self[zip_index]
      arrs.each do |arg_arrays|
        zipped[zip_index] << arg_arrays[zip_index]
      end
    end
    p zipped
  end

  def my_rotate(rotations = 1)
    new_arr = self.map { |element| element }
    if rotations > 0
      rotations.times { |rotation| new_arr.push(new_arr.shift) }
    else
      (rotations * -1).times { |rotation| new_arr.unshift(new_arr.pop) }
    end
    # p self + ["with #{rotations} rotations"]
    new_arr
  end

  def my_join(separator = "")
    joined = ""
    self.my_each { |element| joined = joined + element + separator }
    if joined.length % 2 == 0 && separator != ""
      tail = separator.length
      joined = joined[0...(0-tail)]
    end
    joined
  end

  def my_reverse
    reversed = []
    self.my_each do |element|
      reversed.unshift(element)
    end
    reversed
  end

  

end

# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# a = [1, 2, 3, 4, 5, 6]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3, 5, 6]

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []


# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end

# # => 1
#      2
#      3
#      1
#      2
#      3

# p return_value  # => [1, 2, 3]

