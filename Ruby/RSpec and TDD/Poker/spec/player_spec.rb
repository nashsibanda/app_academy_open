require 'rspec'
require 'player'

describe Player do
  let(:deck) { Deck.new }
  subject(:player) { Player.new(deck) }

  describe "#initialize" do

    it "should have a hand" do
      expect(player.hand).to be_a(Hand)
    end

    it "should have a pot" do
      expect(player.pot).to eq(200)
    end

  end

  describe "#draw" do

    it "should receive a card" do
      player.draw
      expect(player.hand.cards.size).to be >= 1
    end

  end

end