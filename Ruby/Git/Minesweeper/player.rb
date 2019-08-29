class Player
  
  def coords
    puts "Please choose coordinates. Example: for the spot at row 5, column 6, type '5,6':"
    return gets.chomp
  end

  def action
    puts "Would you like to reveal this location, or add/remove a flag? Enter 'r' or 'f'"
    return gets.chomp
  end

end