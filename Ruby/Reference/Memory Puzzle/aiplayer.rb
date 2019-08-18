class AIPlayer
  attr_reader :seen_cards

  def initialize(board)
    @seen_cards = {}
    @matched_card_positions
    @valid_coords = board.valid_coords
  end

  def remember_card(position, card)
    @seen_cards[position] = card
  end

  def guess(first_guess, matched_card_positions)
    positions = @valid_coords - @seen_cards.keys - matched_card_positions
    p matched_card_positions
    p positions
    p first_guess
    p seen_cards
    if @seen_cards.length < 2
      return positions.sample
    end
    if first_guess != nil
      @seen_cards.each do |position, card|
        if card != first_guess && card.face_value == first_guess.face_value
          return position
        end
      end
    end
    if first_guess == nil
      @seen_cards.each do |position_o, card_o|
        @seen_cards.each do |position_i, card_i|
          if card_o != card_i && card_o.face_value == card_i.face_value && !card_o.matched
            return position_o
          end
        end
      end
    end
    return positions.sample
  end
  
end