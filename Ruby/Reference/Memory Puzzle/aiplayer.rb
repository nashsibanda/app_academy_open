class AIPlayer
  attr_reader :seen_cards

  def initialize
    @seen_cards = {}
  end

  def remember_card(position, card)
    @seen_cards[position] = card
  end
  
end