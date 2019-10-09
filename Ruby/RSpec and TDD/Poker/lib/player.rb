require_relative 'hand'

class Player
  attr_reader :hand, :pot
  
  def initialize(deck, pot = 200)
    @hand, @pot, @deck = Hand.new(deck), pot, deck
  end

  def draw
    @hand.draw(@deck.draw)
  end

  # private

  def view_cards
    @hand.cards.each_with_index { |card, idx| puts "#{idx}.   #{card}" }
    puts "Current best hand: #{@hand.best_hand_found.keys.first.to_s.split("_").map(&:capitalize).join(" ")} (#{@hand.high_card.first.last.face}-High) - #{@hand.best_hand_found.values.flatten}"
  end

end

deck = Deck.new
player = Player.new(deck)
deck.shuffle!
5.times do
  player.draw
end
player.hand.analyse_hand
player.view_cards
