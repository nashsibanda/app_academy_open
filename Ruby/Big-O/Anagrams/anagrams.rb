def first_anagram?(string1, string2)
  anagrams = string1.split("").permutation.to_a.map(&:join)
  return anagrams.include?(string2)
end

puts "#first_anagram?"
p first_anagram?("gizmod", "sallys")    #=> false
p first_anagram?("elvis", "lives")    #=> true