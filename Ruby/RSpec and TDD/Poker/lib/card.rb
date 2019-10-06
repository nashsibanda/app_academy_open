class Card
  attr_reader :suit, :face, :value

  def initialize(suit, face, value)
    @suit, @face, @value = suit, face, value
  end
  
end