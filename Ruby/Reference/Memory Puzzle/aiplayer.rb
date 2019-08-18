class AIPlayer
  attr_reader :seen_cards

  def initialize
    @seen_cards = {}
  end

  def remember_card(position, card)
    @seen_cards[position] = card
  end

  def guess(board, first_guess)
    positions = board.valid_coords
    if @seen_cards.length < 0
      return positions.sample
    end
    if first_guess == nil

    end
    return positions.sample
  end
  
end