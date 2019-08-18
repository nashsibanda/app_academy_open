require_relative "./humanplayer.rb"
require_relative "./aiplayer.rb"

class PlayerFacade

  def initialize(type)
    @player = self.player_chooser(type)
  end

  def player_chooser(type)
    case type
    when "h"
      return HumanPlayer.new
    when "a"
      return AIPlayer.new
    end
  end
  
  def guess
    puts "Enter a card position separated by a comma, like this: '0,1'"
    return gets.chomp.split(",").map(&:to_i).reverse
  end

end