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

end