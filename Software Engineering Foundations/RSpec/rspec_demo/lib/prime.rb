def prime?(num)
  return false if num < 2
  (2...num).each do |lt_num|
    if num % lt_num == 0
      return false
    end
  end
  true
end