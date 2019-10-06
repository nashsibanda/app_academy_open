require 'rspec'
require 'deck'

describe Deck do
  subject(:deck) { Deck.new }

  describe "#initialize" do

    it "should contain 52 cards" do
      expect(deck.cards.length).to eq(52)
    end

    it "should not contain duplicate cards" do
      expect(deck.cards.uniq).to eq(deck.cards)
    end

  end

  describe "#shuffle!" do

    it "should shuffle card order"
    
  end

end