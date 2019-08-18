require "colorize"
require "colorized_string"

class Tile
  attr_reader :given, :position
  attr_accessor :number
  
  def initialize(number, given, position)
    @number = number
    @given = given
    @position = position
  end

  def to_s
    if given == true
      " #{@number} ".colorize(:blue)
    else
      " #{@number} "
    end
  end

end