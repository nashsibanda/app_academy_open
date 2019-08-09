def find_bigrams(str, bigrams)
  bigrams_found = []
  bigrams.each do |bigram|
    str[0...-1].each_char.with_index do |char, idx|
      if str[idx] + str[idx + 1] == bigram
        bigrams_found << bigram
      end
    end
  end
  bigrams_found
end

p find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])