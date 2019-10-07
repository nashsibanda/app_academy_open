require_relative 'deck'

class Hand
  HANDS = {
    royal_flush: "Royal Flush",
    straight_flush: "Straight Flush",
    four_of_a_kind: "Four of a Kind",
    full_house: "Full House",
    flush: "Flush",
    straight: "Straight",
    three_of_a_kind: "Three of a Kind",
    two_pair: "Two Pair",
    one_pair: "One Pair",
    high_card: "High Card"
  }

  attr_reader :deck
  attr_accessor :cards

  def initialize(deck)
    @cards = []
    @deck = deck
  end

  def draw(card)
    @cards << card
  end
  
end