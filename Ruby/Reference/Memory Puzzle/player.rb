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

  def remember_card(position, card)
    @player.remember_card(position, card)
  end

  def seen_cards
    @player.seen_cards
  end
  
  def guess
    @player.guess
  end

end