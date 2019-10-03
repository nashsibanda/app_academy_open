require 'rspec'
require 'dessert'
require 'spec_helper'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) { Dessert.new("cake", 5, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("cake")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(5)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect do
        Dessert.new("cake", "five", chef)
      end.to raise_error(ArgumentError)
    end

  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("butter")
      expect(dessert.ingredients).to include("butter")
    end
  end
  
  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.add_ingredient("flour")
      dessert.add_ingredient("sugar")
      dessert.add_ingredient("water")
      dessert.add_ingredient("butter")
      @original_order = dessert.ingredients.dup
      dessert.mix!
      expect(dessert.ingredients).not_to eq(@original_order)
      expect(dessert.ingredients).to match_array(@original_order)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(1)
      expect(dessert.quantity).to eq(4)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect do
        dessert.eat(6)
      end.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Maester Butterscotch")
      expect(dessert.serve).to include("Maester Butterscotch")
    end
  end
  
  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake).and_return(dessert.heat!)
      dessert.make_more
      expect(dessert.temp).to eq(400)
    end
  end
end
