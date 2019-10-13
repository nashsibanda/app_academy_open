def first_anagram?(string1, string2)
  anagrams = string1.split("").permutation.to_a.map(&:join)
  return anagrams.include?(string2)
end

def second_anagram?(string1, string2)
  string1.each_char { |char| string2.delete!(char) }
  string2.empty?
end

def third_anagram?(string1, string2)
  string1.split("").sort == string2.split("").sort
end

def fourth_anagram?(string1, string2)
  hash1, hash2 = Hash.new(0), Hash.new(0)
  string1.each_char { |char| hash1[char] += 1 }
  string2.each_char { |char| hash2[char] += 1 }
  hash1 == hash2
end

def fourth_anagram_bonus?(string1, string2)
  hash1 = Hash.new(0)
  string1.each_char { |char| hash1[char] += 1 }
  string2.each_char { |char| hash1[char] -= 1 }
  hash1.all? {|k,v| v == 0}
end

# puts "#first_anagram?"
# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

# puts "#second_anagram?"
# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

# puts "#third_anagram?"
# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true

puts "#fourth_anagram?"
p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true

puts "#fourth_anagram_bonus?"
p fourth_anagram_bonus?("gizmo", "sally")    #=> false
p fourth_anagram_bonus?("elvis", "lives")    #=> true