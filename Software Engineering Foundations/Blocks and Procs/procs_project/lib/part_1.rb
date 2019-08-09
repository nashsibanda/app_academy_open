def my_map(array, &prc)
  output = []
  array.each { |ele| output << prc.call(ele) }
  output
end

def my_select(array, &prc)
  output = []
  array.each { |ele| output << ele if prc.call(ele) }
  output
end

def my_count(array, &prc)
  output = 0
  array.each { |ele| output += 1 if prc.call(ele) }
  output
end

def my_any?(array, &prc)
  array.each { |ele| return true if prc.call(ele) }
  false
end

def my_all?(array, &prc)
  array.each { |ele| return false if !prc.call(ele) }
  true
end

def my_none?(array, &prc)
  array.each { |ele| return false if prc.call(ele) }
  true
end