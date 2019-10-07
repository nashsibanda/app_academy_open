require 'rspec'
require 'hand'

SUITS = %i(hearts clubs spades diamonds)
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
    
    it "should detect a straight flush" do
      hand.draw(@test_cards["Q_of_hearts"])
      hand.draw(@test_cards["K_of_hearts"])
      hand.draw(@test_cards["9_of_hearts"])
      hand.draw(@test_cards["J_of_hearts"])
      hand.draw(@test_cards["10_of_hearts"])
      hand.find_best_hand
      expect(hand.best_hand).to have_key(:straight_flush)
    end
    
    it "should detect a four of a kind" do
      hand.draw(@test_cards["Q_of_hearts"])
      hand.draw(@test_cards["Q_of_spades"])
      hand.draw(@test_cards["Q_of_clubs"])
      hand.draw(@test_cards["Q_of_diamonds"])
      hand.draw(@test_cards["10_of_hearts"])
      hand.find_best_hand
      expect(hand.best_hand).to have_key(:four_of_a_kind)
    end
    
    it "should detect a full house" do
      hand.draw(@test_cards["Q_of_hearts"])
      hand.draw(@test_cards["Q_of_spades"])
      hand.draw(@test_cards["Q_of_clubs"])
      hand.draw(@test_cards["J_of_hearts"])
      hand.draw(@test_cards["J_of_clubs"])
      hand.find_best_hand
      expect(hand.best_hand).to have_key(:full_house)
    end
    
    it "should detect a flush" do
      hand.draw(@test_cards["Q_of_hearts"])
      hand.draw(@test_cards["J_of_hearts"])
      hand.draw(@test_cards["3_of_hearts"])
      hand.draw(@test_cards["5_of_hearts"])
      hand.draw(@test_cards["6_of_hearts"])
      hand.find_best_hand
      expect(hand.best_hand).to have_key(:flush)
    end
    
    it "should detect a straight" do
      hand.draw(@test_cards["2_of_spades"])
      hand.draw(@test_cards["4_of_hearts"])
      hand.draw(@test_cards["3_of_diamonds"])
      hand.draw(@test_cards["5_of_hearts"])
      hand.draw(@test_cards["A_of_hearts"])
      hand.find_best_hand
      expect(hand.best_hand).to have_key(:straight)
    end
    
    it "should detect a three of a kind" do
      hand.draw(@test_cards["2_of_spades"])
      hand.draw(@test_cards["2_of_hearts"])
      hand.draw(@test_cards["2_of_diamonds"])
      hand.draw(@test_cards["5_of_hearts"])
      hand.draw(@test_cards["A_of_hearts"])
      hand.find_best_hand
      expect(hand.best_hand).to have_key(:three_of_a_kind)
    end
    
    it "should detect a two pair" do
      hand.draw(@test_cards["2_of_spades"])
      hand.draw(@test_cards["2_of_hearts"])
      hand.draw(@test_cards["5_of_diamonds"])
      hand.draw(@test_cards["5_of_hearts"])
      hand.draw(@test_cards["A_of_hearts"])
      hand.find_best_hand
      expect(hand.best_hand).to have_key(:two_pair)
    end
    
    it "should detect a one pair" do
      hand.draw(@test_cards["2_of_spades"])
      hand.draw(@test_cards["7_of_hearts"])
      hand.draw(@test_cards["5_of_diamonds"])
      hand.draw(@test_cards["5_of_hearts"])
      hand.draw(@test_cards["A_of_hearts"])
      hand.find_best_hand
      expect(hand.best_hand).to have_key(:one_pair)
    end
    
    it "should detect a high card" do
      hand.draw(@test_cards["2_of_spades"])
      hand.draw(@test_cards["7_of_hearts"])
      hand.draw(@test_cards["5_of_diamonds"])
      hand.draw(@test_cards["Q_of_hearts"])
      hand.draw(@test_cards["A_of_hearts"])
      hand.find_best_hand
      expect(hand.best_hand).to have_key(:high_card)
    end

  end

  describe "#find_high_card" do

    it "should detect highest value card"

    context "with a straight starting at A" do

      it "should detect correct high value card"

    end

  end

end