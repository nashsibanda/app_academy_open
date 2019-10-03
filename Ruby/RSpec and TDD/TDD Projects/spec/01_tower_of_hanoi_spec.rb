require 'rspec'
require '01_tower_of_hanoi'

describe TowersGame do

  describe "#initialize" do
    
    it "creates three arrays"

    it "assigns requested number of discs to first array"

  end

  describe "#move_disc" do

    it "moves the top-most disc to another array"

    it "raises an error if moving disc onto a smaller one"

  end

  describe "#user_move" do

    it "prompts the user to choose start and end arrays"

    it "calls #move_disc with the arrays chosen"

    it "raises an error if user chooses an empty array"

    it "handles errors from #move_disc"

    it "lets user re-attempt after an invalid move"

  end

  describe "#play" do

    it "repeatedly calls #user_move"

    it "ends the game when the puzzle is solved"

  end

end