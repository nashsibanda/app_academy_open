require 'rspec'
require '01_tower_of_hanoi'

describe TowersGame do
  subject(:game) { TowersGame.new(4) }

  describe "#initialize" do
    
    it "creates three arrays" do
      expect(game.tower1).to be_an(Array)
      expect(game.tower1).to be_an(Array)
      expect(game.tower1).to be_an(Array)
    end
    
    it "assigns requested number of discs to first array" do
      expect(game.tower1).to eq([1, 2, 3, 4])
    end
    
  end
  
  describe "#move_disc" do
  
    it "moves the top-most disc to another array" do
      game.move_disc(1, 2)
      expect(game.tower1).to eq([2, 3, 4])
      expect(game.tower2).to eq([1])
    end
    
    it "raises an error if moving disc onto a smaller one" do
      game.move_disc(1, 2)
      expect { game.move_disc(1, 2) }.to raise_error("Can't place a disc above a smaller disc")
    end
    
  end

  describe 'won?' do
    
    it "returns false if the game isn't won" do
      expect(game.won?).to be false
    end
    
    it "returns true if game is won" do
      game.move_disc(1, 2)
      game.move_disc(1, 3)
      game.move_disc(2, 3)
      game.move_disc(1, 2)
      game.move_disc(3, 1)
      game.move_disc(3, 2)
      game.move_disc(1, 2)
      game.move_disc(1, 3)
      game.move_disc(2, 1)
      game.move_disc(2, 3)
      game.move_disc(1, 2)
      game.move_disc(3, 1)
      game.move_disc(2, 1)
      game.move_disc(2, 3)
      game.move_disc(1, 2)
      game.move_disc(1, 3)
      game.move_disc(2, 3)
      expect(game.won?).to be true
    end

  end

end