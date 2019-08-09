def palindrome?(str)
  (str.length / 2).times do |idx|
    if str[idx] != str[-idx - 1]
      return false
    end
  end
  true
end

def substrings(str)
  output = []
  str.each_char.with_index do |char_1, idx_1|
    str.each_char.with_index do |char_2, idx_2|
      if idx_1 <= idx_2
        output << str[idx_1..idx_2]
      end
    end
  end
  output
end

def palindrome_substrings(str)
  all_substrings = substrings(str)
  output = all_substrings.select { |substr| palindrome?(substr) && substr.length > 1 }
end