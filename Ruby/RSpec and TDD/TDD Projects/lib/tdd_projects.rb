class Array
  
  def my_uniq
    output = []
    self.each { |element| output << element unless output.include?(element) }
    output
  end

  def two_sum
    output = []
    self.each_with_index do |num, idx|
      self.each_with_index do |s_num, s_idx|
        output << [idx, s_idx] if num + s_num == 0 && idx != s_idx
      end
    end
    output.map(&:sort).my_uniq
  end

  def my_transpose
    output = []
    self.length.times do |i|
      transposed_array = []
      self.each { |sub_array| transposed_array << sub_array[i] }
      output << transposed_array
    end
    output
  end

end