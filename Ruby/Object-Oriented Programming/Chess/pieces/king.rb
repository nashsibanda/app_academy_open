require_relative "stepable"
require_relative "piece"

class King < Piece
  include Stepable

  def symbol
    return "♚"
  end
  
  def move_diffs
    diffs = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
    return diffs
  end

end