class AIPlayer
  attr_reader :seen_cards

  def initialize(board)
    @seen_cards = {}
    @matched_card_positions
    @valid_coords
  end

  def remember_card(position, card)
    @seen_cards[position] = card
  end

  def guess(board, first_guess)
    positions = board.valid_coords
    if @seen_cards.length < 2
      return positions.sample
    end
    if first_guess == nil

    end
    return positions.sample
  end
  
end