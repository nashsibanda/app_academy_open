def average(num_1, num_2)
  (num_1 + num_2) / 2.0
end

def average_array(arr)
  arr.sum / arr.length.to_f
end

def repeat(str, num)
  str * num
end

def yell(str)
  str.upcase + "!"
end

def alternating_case(str)
  output = []
  str.split(' ').each_index do |idx|
    output << str.split[idx].upcase if idx % 2 == 0
    output << str.split[idx].downcase if idx % 2 != 0
  end
  output.join(' ')
end