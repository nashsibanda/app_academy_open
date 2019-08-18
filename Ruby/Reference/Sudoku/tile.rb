class Tile
  attr_reader :number, :given, :position
  
  def initialize(number, given, position)
    @number = number
    @given = given
    @position = position
  end

end