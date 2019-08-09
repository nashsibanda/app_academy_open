# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return self.sort[-1] - self.sort[0] if self.length > 0
  end

  def average
    return (self.sum / (self.length * 1.0)) if self.length > 0
  end

  def median
    if self.length == 0
      nil
    elsif self.length % 2 == 0
      (self.sort[(self.length/2) - 1] + self.sort[(self.length/2)]) / 2.0
    else
      self.sort[(self.length/2)]
    end
  end
  
  def counts
    output = Hash.new(0)
    self.each { |ele| output[ele] += 1 }
    output
  end

  def my_count(value)
    count = 0
    self.each { |ele| count += 1 if ele == value }
    count
  end

  def my_index(value)
    self.each_with_index do |ele, idx|
      return idx if ele == value
    end
    nil
  end

  def my_uniq
    output = []
    self.each do |ele|
      output << ele if !output.include?(ele)
    end
    output
  end

  def my_transpose
    output = Array.new(self.length) {Array.new}
    self.length.times do |search_idx|
      self.each do |ele|
        output[search_idx] << ele[search_idx]
      end
    end
    output
  end


end

arr_1 = [
          ["a", "b", "c"],
          ["d", "e", "f"],
          ["g", "h", "i"]
        ]
 p arr_1.my_transpose