def all_words_capitalized?(array)
  array.all? { |word| word == word.capitalize }
end

def no_valid_url?(url_array)
  tlds = [".com", ".net", ".io", ".org"]
  tlds.each do |tld|
      return false if !url_array.none? { |url| url.include?(tld)}
  end
  true
end

def any_passing_students?(student_hashes)
  student_hashes.any? { |student| (student[:grades].sum / student[:grades].length) >= 75 }
end