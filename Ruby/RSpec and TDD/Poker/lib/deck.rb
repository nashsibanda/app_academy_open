require_relative 'card'

class Deck
  SUITS = %i(hearts clubs diamonds spades)
  FACES_VALUES = {
    "A" => [1, 14],
    "2" => [2],
    "3" => [3],
    "4" => [4],
    "5" => [5],
    "6" => [6],
    "7" => [7],
    "8" => [8],
    "9" => [9],
    "10" => [10],
    "J" => [11],
    "Q" => [12],
    "K" => [13]
  }

  attr_reader :cards

  def initialize
    @cards = []
    build_deck
  end

  def shuffle!
    @cards.shuffle!
  end

  def deal
    @cards.shift
  end

  def rebuild_deck
    build_deck
    shuffle!
  end

  private

  def build_deck
    @cards = []
    SUITS.each do |suit|
      FACES_VALUES.each do |face, value|
        @cards.push(Card.new(suit, face, value))
      end
    end
  end

end