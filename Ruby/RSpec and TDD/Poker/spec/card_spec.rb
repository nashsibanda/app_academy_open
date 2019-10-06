require 'rspec'
require 'card'

describe Card do
  subject(:card) { Card.new(:hearts, "9", [9]) }

  describe "#initialize" do

    it "should have a suit" do
      expect(card.suit).to eq(:hearts)
    end
    
    it "should have a face" do
      expect(card.face).to eq("9")
    end
    
    it "should have a value" do
      expect(card.value).to eq([9])
    end

  end

end