class Player
  
  def input
    puts "Change a number. Example: to change the number at spot [3, 5] to 7, enter '3,5,7'."
    return gets.chomp.split(",").map(&:to_i)
  end

end