require_relative 'deck'

class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end
  
end