class Card
  attr_reader :suit, :face, :value

  def initialize(suit, face, value)
    @suit, @face, @value = suit, face, value
  end

  def to_s
    "#{@face} of #{@suit}"
  end
  
  def inspect
    "#{@face} of #{@suit}"
  end

end