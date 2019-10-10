fish_array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish(array)
  longest = array[0]
  array.each do |element|
    array.each do |element_2|
      longest = element_2 if element_2.length > element.length
    end
  end
  longest
end

def dominant(array)
  merge_sort(array).last
end

def merge_sort(array)
  return array if array.length <= 1
  left_slice, right_slice = slice(array)[0], slice(array)[1]
  return merge(left_slice, right_slice) if left_slice.length <= 1 && right_slice.length <= 1
  merge(merge_sort(left_slice), merge_sort(right_slice))
end

def slice(array)
  array.each_slice( (array.length/2.0).ceil ).to_a
end

def merge(left_arr, right_arr, merged = Array.new([]))
  return merged if left_arr.empty? && right_arr.empty?
  if right_arr.empty? || (!left_arr.empty? && left_arr.first.length <= right_arr.first.length)
    merged << left_arr.shift
    merge(left_arr, right_arr, merged)
  elsif left_arr.empty? || left_arr.first.length > right_arr.first.length
    merged << right_arr.shift
    merge(left_arr, right_arr, merged)
  end
end

def clever(array)
  longest = array[0]
  array.each { |element| longest = element if element.length > longest.length }
  longest
end

p sluggish(fish_array)
p dominant(fish_array)
p clever(fish_array)