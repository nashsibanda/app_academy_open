class Player
  
  def guess
    puts "Enter a card position separated by a comma, like this: '0,1'"
    return gets.chomp.split(",").map(&:to_i).reverse
  end

end