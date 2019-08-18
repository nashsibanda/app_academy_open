require "colorize"
require "colorized_string"

class Tile
  attr_reader :given, :position, :number
  # attr_accessor :number
  
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

  def number=(value)
    @number = value if @given == false
    puts "Can't change a given (blue) number!".colorize(:yellow) if @given == true
  end

end