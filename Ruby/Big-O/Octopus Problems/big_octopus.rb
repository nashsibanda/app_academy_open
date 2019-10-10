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

p sluggish(fish_array)