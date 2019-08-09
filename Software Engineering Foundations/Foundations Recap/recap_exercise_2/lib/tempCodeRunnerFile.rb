def most_frequent_bigram(str)
  bigrams = []
  # bigrams_hash = Hash.new(0)
  (0...(str.length-1)).each do |idx|
    bigrams << str[idx] + str[idx + 1]
  end
  most_frequent = ""
  i = 0
  bigrams.each do |bigram|
    if bigrams.count(bigram) > i
      most_frequent = bigram
      i = bigrams.count(bigram)
    end
  end
  most_frequent
  # bigrams.each { |bigram| bigrams_hash[bigram] += 1 }
  # bigrams_hash
end

p most_frequent_bigram("thethrillofit")