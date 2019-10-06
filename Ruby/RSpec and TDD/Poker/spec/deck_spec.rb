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

    it "should shuffle card order" do
      original = deck.cards.dup
      deck.shuffle!
      expect(deck.cards).to match_array(original)
      expect(deck.cards).not_to eq(original)
    end

  end

  describe "#draw" do

    it "should pop a card from the deck" do
      deck.shuffle!
      top_card = deck.cards.first
      expect(deck.draw).to eq(top_card)
    end

  end

end