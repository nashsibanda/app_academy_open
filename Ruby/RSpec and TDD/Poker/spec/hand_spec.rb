require 'rspec'
require 'hand'

SUITS = %i(hearts clubs)
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

describe Hand do
  let(:deck) { Deck.new }
  subject(:hand) { Hand.new(deck) }
  before(:all) do
    @test_cards = {}
    SUITS.each do |suit|
      FACES_VALUES.each do |face, value|
        @test_cards["#{face}_of_#{suit}"] = Card.new(suit, face, value)
      end
    end
  end


  describe "#initialize" do

    it "should have an array" do
      expect(hand.cards).to be_an(Array)
    end

    it "should have a deck" do
      expect(hand.deck).to be_a(Deck)
    end

  end

  describe "#draw" do

    it "should add a card to @cards" do
      hand.draw(@test_cards["A_of_hearts"])
      expect(hand.cards).to include(@test_cards["A_of_hearts"])
    end

  end

  describe "#find_best_hand" do

    it "should detect a royal flush" do
      hand.draw(@test_cards["Q_of_hearts"])
      hand.draw(@test_cards["K_of_hearts"])
      hand.draw(@test_cards["A_of_hearts"])
      hand.draw(@test_cards["J_of_hearts"])
      hand.draw(@test_cards["10_of_hearts"])
      hand.find_best_hand
      expect(hand.best_hand).to have_key(:royal_flush)
    end

    it "should detect a straight flush"

    it "should detect a four of a kind"
    
    it "should detect a full house"
    
    it "should detect a flush"
    
    it "should detect a straight"
    
    it "should detect a three of a kind"
    
    it "should detect a two pair"
    
    it "should detect a one pair"

    context "high card" do

      it "should detect a high card"

      it "should return the high card face"

    end

  end

  describe "#find_high_card" do

end