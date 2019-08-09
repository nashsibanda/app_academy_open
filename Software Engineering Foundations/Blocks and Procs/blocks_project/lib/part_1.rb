def select_even_nums (arr)
  arr.select(&:even?)
end

def reject_puppies(dogs)
  dogs.reject { |dog_hash| dog_hash["age"] <= 2 }
end

def count_positive_subarrays(big_arr)
  big_arr.count { |array| array.sum > 0 }
end

def aba_translate(word)
  vowels = "aeiou"
  i = 1
  word.each_char.with_index do |char, idx|
    if vowels.include?(char)
      word.insert(idx + i, "b" + char)
      i += 2
    end
  end
  word
end

def aba_array(words)
  words.map { |word| aba_translate(word) }
end