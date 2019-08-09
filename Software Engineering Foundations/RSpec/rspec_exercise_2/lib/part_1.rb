def partition(arr, num)
  output = Array.new(2) { Array.new }
  arr.each do |el|
    output[0] << el if el < num
    output[1] << el if el >= num
  end
  output
end

def merge(hash_1, hash_2)
  output = {}
  hash_1.each { |key, val| output[key] = val }
  hash_2.each { |key, val| output[key] = val }
  output
end

def censor(str, arr)
  words = str.split(' ')
  vowels = 'aeiou'.split('')
  words.each_with_index do |word, idx|
    if arr.include?(word.downcase)
      word.each_char.with_index do |char, idx|
        if vowels.include?(char.downcase)
          word[idx] = '*'
        end
      end
    end
  end
  words.join(' ')
end

def power_of_two?(num)
  (0...num).each do |exp|
    if 2 ** exp == num
      return true
    end
  end
  false
end
