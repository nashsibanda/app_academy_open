def flatten(data)
  return [data] if !data.instance_of?(Array)
  output = []
  data.each do |ele|
    output += flatten(ele)
  end
  output
end

array_1 = [1, 2, [[3, 4], [5, [6]]], [7, 8]]
p flatten(array_1)