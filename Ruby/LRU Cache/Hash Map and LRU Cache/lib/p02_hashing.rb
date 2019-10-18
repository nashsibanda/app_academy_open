class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    int_to_hash = self.length
    self.each_with_index { |el, idx| int_to_hash += (el.object_id * (idx + 1 + self.length)) }
    int_to_hash.hash
  end
end

class String
  def hash
    byte_arr = []
    self.each_byte { |char| byte_arr << char }
    byte_arr.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash_str_arr = self.to_a.flatten.map(&:to_s)
    str_hashes_arr = []
    hash_str_arr.each { |string| str_hashes_arr << string.hash }
    str_hashes_arr.sort.hash
  end
end
