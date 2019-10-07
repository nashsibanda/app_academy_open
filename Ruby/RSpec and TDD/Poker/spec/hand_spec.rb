require 'rspec'
require 'hand'

describe Hand do
  let(:deck) { Deck.new }
  subject(:hand) { Hand.new(deck) }

  describe "#initialize" do

    it "should have an array" do
      expect(hand.cards).to be_an(Array)
    end

    it "should have a deck" do
      expect(hand.deck).to be_a(Deck)
    end

  end

end