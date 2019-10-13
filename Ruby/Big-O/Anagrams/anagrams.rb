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

# puts "#first_anagram?"
# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

# puts "#second_anagram?"
# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

puts "#third_anagram?"
p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true