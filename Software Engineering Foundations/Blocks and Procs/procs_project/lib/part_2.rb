def reverser(str, &prc)
  prc.call(str.reverse)
end

def word_changer(sentence, &prc)
  output = sentence.split.map(&prc)
  output.join(" ")
end

def greater_proc_value(num, prc_1, prc_2)
  if prc_1.call(num) >= prc_2.call(num)
    return prc_1.call(num)
  else
    return prc_2.call(num)
  end
end

def and_selector(array, prc_1, prc_2)
  array.select { |ele| prc_1.call(ele) && prc_2.call(ele) }
end

def alternating_mapper(array, prc_1, prc_2)
  output = []
  array.each_index do |idx|
    if idx.even?
      output << prc_1.call(array[idx])
    else
      output << prc_2.call(array[idx])
    end
  end
  output
end