class AIPlayer

  def initialize
    @seen_cards = {}
  end

  def remember_card(position, card)
    @seen_cards[position] = card
  end
  
end