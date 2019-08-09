# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
  (1..num).reverse_each do |factor|
    if num % factor == 0 && prime?(factor)
      return factor
    end
  end
end

def prime?(num)
  (2...num).each do |factor|
    return false if num % factor == 0
  end
  true
end

# =============

def unique_chars?(str)
  str.each_char.with_index do |char_1, idx_1|
    str.each_char.with_index do |char_2, idx_2|
      return false if str[idx_1] == str[idx_2] && idx_1 != idx_2
    end
  end
  true
end

# =============

def dupe_indices(arr)
  output = Hash.new([])
  arr.each_with_index do |char, idx|
    output[char] += [idx]
  end
  output.delete_if { |key, value| value.length < 2 }
  output
end

# =============

def ana_array(arr1, arr2)
  return false if arr1.length != arr2.length
  arr1.each_with_index { |ele, idx| return false if !arr2.include?(ele) }
  arr2.each_with_index { |ele, idx| return false if !arr1.include?(ele) }
  true
end


def chess(size)
  size.times do |i|
    if size == 1
      puts "#"
    elsif i % 2 != 0
      puts ("# " * (size))
    else
      puts (" #" * (size)) 
    end
  end
end

chess(1)