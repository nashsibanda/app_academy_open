require_relative "slideable"
require_relative "piece"

class Bishop < Piece
  include Slideable

  def symbol
    return :bishop
  end
  
  def move_dirs
    directions = DIAGONAL_DIRS
    return directions
  end

end