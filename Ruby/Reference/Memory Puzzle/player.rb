require_relative "./humanplayer.rb"
require_relative "./aiplayer.rb"

class PlayerFacade

  def initialize(type, board)
    @player = self.player_chooser(type, board)
  end

  def player_chooser(type, board)
    case type
    when "h"
      return HumanPlayer.new(board)
    when "a"
      return AIPlayer.new(board)
    end
  end

  def remember_card(position, card)
    @player.remember_card(position, card)
  end

  def seen_cards
    @player.seen_cards
  end
  
  def guess(first_guess, matched_card_positions)
    @player.guess(first_guess, matched_card_positions)
  end

end