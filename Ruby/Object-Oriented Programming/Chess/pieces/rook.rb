require_relative "slideable"
require_relative "piece"

class Rook < Piece
  include Slideable

  def symbol
    return "♜"
  end
  
  def move_dirs
    directions = HORIZONTAL_DIRS
    return directions
  end

end