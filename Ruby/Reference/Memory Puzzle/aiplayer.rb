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
    return positions.sample
  end
  
end