require 'rspec'
require 'hand'

describe Hand do
  subject(:hand) { Hand.new }

  describe "#initialize" do

    it "should have an array" do
      expect(hand.cards).to be_an(Array)
    end

  end

end