require_relative "slideable"
require_relative "piece"

class Queen < Piece
  include Slideable

  def symbol
    return :queen
  end
  
  def move_dirs
    directions = HORIZONTAL_DIRS + DIAGONAL_DIRS
    return directions
  end

end

# temp = Queen.new(:white, "board", [0, 0])
# p temp.move_dirs