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

  def draw(hand_symbol)
    case hand_symbol
    when :royal_flush
      hand.draw(@test_cards["Q_of_hearts"])
      hand.draw(@test_cards["K_of_hearts"])
      hand.draw(@test_cards["A_of_hearts"])
      hand.draw(@test_cards["J_of_hearts"])
      hand.draw(@test_cards["10_of_hearts"])
    when :ace_high_straight
      hand.draw(@test_cards["Q_of_hearts"])
      hand.draw(@test_cards["K_of_clubs"])
      hand.draw(@test_cards["A_of_hearts"])
      hand.draw(@test_cards["J_of_spades"])
      hand.draw(@test_cards["10_of_hearts"])
    when :straight_flush
      hand.draw(@test_cards["Q_of_hearts"])
      hand.draw(@test_cards["K_of_hearts"])
      hand.draw(@test_cards["9_of_hearts"])
      hand.draw(@test_cards["J_of_hearts"])
      hand.draw(@test_cards["10_of_hearts"])
    when :four_of_a_kind
      hand.draw(@test_cards["Q_of_hearts"])
      hand.draw(@test_cards["Q_of_spades"])
      hand.draw(@test_cards["Q_of_clubs"])
      hand.draw(@test_cards["Q_of_diamonds"])
      hand.draw(@test_cards["10_of_hearts"])
    when :full_house
      hand.draw(@test_cards["Q_of_hearts"])
      hand.draw(@test_cards["Q_of_spades"])
      hand.draw(@test_cards["Q_of_clubs"])
      hand.draw(@test_cards["J_of_hearts"])
      hand.draw(@test_cards["J_of_clubs"])
    when :flush
      hand.draw(@test_cards["Q_of_hearts"])
      hand.draw(@test_cards["J_of_hearts"])
      hand.draw(@test_cards["3_of_hearts"])
      hand.draw(@test_cards["5_of_hearts"])
      hand.draw(@test_cards["6_of_hearts"])
    when :straight
      hand.draw(@test_cards["2_of_spades"])
      hand.draw(@test_cards["4_of_hearts"])
      hand.draw(@test_cards["3_of_diamonds"])
      hand.draw(@test_cards["5_of_hearts"])
      hand.draw(@test_cards["A_of_hearts"])
    when :three_of_a_kind
      hand.draw(@test_cards["2_of_spades"])
      hand.draw(@test_cards["2_of_hearts"])
      hand.draw(@test_cards["2_of_diamonds"])
      hand.draw(@test_cards["5_of_hearts"])
      hand.draw(@test_cards["A_of_hearts"])
    when :two_pair
      hand.draw(@test_cards["2_of_spades"])
      hand.draw(@test_cards["2_of_hearts"])
      hand.draw(@test_cards["5_of_diamonds"])
      hand.draw(@test_cards["5_of_hearts"])
      hand.draw(@test_cards["A_of_hearts"])
    when :one_pair
      hand.draw(@test_cards["2_of_spades"])
      hand.draw(@test_cards["7_of_hearts"])
      hand.draw(@test_cards["5_of_diamonds"])
      hand.draw(@test_cards["5_of_hearts"])
      hand.draw(@test_cards["A_of_hearts"])
    when :high_card
      hand.draw(@test_cards["2_of_spades"])
      hand.draw(@test_cards["7_of_hearts"])
      hand.draw(@test_cards["5_of_diamonds"])
      hand.draw(@test_cards["Q_of_hearts"])
      hand.draw(@test_cards["A_of_hearts"])
    end
  end

  describe "#best_hand" do

    it "should detect a royal flush" do
      draw(:royal_flush)
      expect(hand.best_hand).to have_key(:royal_flush)
    end
    
    it "should detect a straight flush" do
      draw(:straight_flush)
      expect(hand.best_hand).to have_key(:straight_flush)
    end
    
    it "should detect a four of a kind" do
      draw(:four_of_a_kind)
      expect(hand.best_hand).to have_key(:four_of_a_kind)
    end
    
    it "should detect a full house" do
      draw(:full_house)
      expect(hand.best_hand).to have_key(:full_house)
    end
    
    it "should detect a flush" do
      expect(hand.best_hand).to have_key(:flush)
    end
    
    it "should detect a straight" do
      draw(:straight)
      expect(hand.best_hand).to have_key(:straight)
    end
    
    it "should detect a three of a kind" do
      draw(:three_of_a_kind)
      expect(hand.best_hand).to have_key(:three_of_a_kind)
    end
    
    it "should detect a two pair" do
      draw(:two_pair)
      expect(hand.best_hand).to have_key(:two_pair)
    end
    
    it "should detect a one pair" do
      draw(:one_pair)
      expect(hand.best_hand).to have_key(:one_pair)
    end
    
    it "should detect a high card" do
      draw(:high_card)
      expect(hand.best_hand).to have_key(:high_card)
    end

  end

  describe "#find_high_card" do

    context "with a straight, flush, straight flush or royal flush" do

      it "should return highest face card" do
        draw(:flush)
        hand.best_hand
        expect(hand.find_high_card).to include( :high_card => @test_cards["Q_of_hearts"] )
      end
      
      context "with a straight containing A" do
        
        it "should return correct high face card for low A" do
          draw(:straight)
          hand.best_hand
          expect(hand.find_high_card).to include( :high_card => @test_cards["5_of_hearts"] )
        end
        
        it "should correctly return Ace-high" do
          draw(:ace_high_straight)
          hand.best_hand
          expect(hand.find_high_card).to include( :high_card => @test_cards["A_of_hearts"] )
        end
        
      end
      
    end
    
    context "with a full house" do
      
      it "should return triplet face" do
        draw(:full_house)
        hand.best_hand
        expect(hand.find_high_card[:triplet]).to eq(@test_cards["Q_of_hearts"]).or eq(@test_cards["Q_of_spades"]).or eq(@test_cards["Q_of_clubs"])
      end
      
      it "should return face of pair" do
        draw(:full_house)
        hand.best_hand
        expect(hand.find_high_card[:pair]).to eq(@test_cards["J_of_hearts"]).or eq(@test_cards["J_of_clubs"])
      end
      
    end
    
    context "with a two pair" do
      
      it "should return highest pair face" do
        draw(:two_pair)
        hand.best_hand
        expect(hand.find_high_card[:high_pair]).to eq(@test_cards["5_of_diamonds"]).or eq(@test_cards["5_of_hearts"])
      end
      
      it "should return lowest pair face" do
        draw(:two_pair)
        hand.best_hand
        expect(hand.find_high_card[:low_pair]).to eq(@test_cards["2_of_spades"]).or eq(@test_cards["2_of_hearts"])
      end
      
      it "should return kicker face" do
        draw(:two_pair)
        hand.best_hand
        expect(hand.find_high_card[:kicker]).to eq(@test_cards["A_of_hearts"])
      end
      
    end
    
    context "with a four or three of a kind" do
      
      it "should return 'of a kind' face" do
        draw(:four_of_a_kind)
        hand.best_hand
        expect(hand.find_high_card[:quad]).to eq(@test_cards["Q_of_hearts"]).or eq(@test_cards["Q_of_spades"]).or eq(@test_cards["Q_of_clubs"]).or eq(@test_cards["Q_of_diamonds"])
      end
      
      it "should return highest kicker face" do
        draw(:four_of_a_kind)
        hand.best_hand
        expect(hand.find_high_card[:high_kicker]).to eq(@test_cards["10_of_hearts"])
      end
      
      it "should return lowest kicker face" do
        draw(:three_of_a_kind)
        hand.best_hand
        expect(hand.find_high_card[:low_kicker]).to eq(@test_cards["5_of_hearts"])
      end

    end

  end


end
