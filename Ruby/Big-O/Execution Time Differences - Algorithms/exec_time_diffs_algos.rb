require "byebug"

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

def my_min(list)
  bigger_numbers = []
  # debugger
  list.each do |element|
    list.each do |comp_element|
      if comp_element < element
        bigger_numbers << element 
      end
    end
  end
  return (list - bigger_numbers).first
end

p my_min(list)  # =>  -5