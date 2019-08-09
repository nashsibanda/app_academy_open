def hipsterfy(word)
  vowels = 'aeiou'
  letters = word.split('')
  return word if letters.all? { |let| !vowels.include?(let) }
  pop_idx = letters.rindex { |let| vowels.include?(let) }
  letters.delete_at(pop_idx)
  letters.join
end

def vowel_counts(str)
  vowels = 'aeiou'
  output = Hash.new(0)
  letters = str.downcase.split('')
  letters.each do |let|
    if vowels.include?(let)
      output[let] += 1
    end
  end
  output
end

def caesar_cipher(str, num)
  alphabet = ('a'..'z').to_a
  str.each_char.with_index do |char, idx|
    if alphabet.include?(char)
      alph_idx = alphabet.index(char)
      str[idx] = alphabet[(alph_idx + num) % 26]
    end
  end
  str
end

p caesar_cipher("hello123", 2)