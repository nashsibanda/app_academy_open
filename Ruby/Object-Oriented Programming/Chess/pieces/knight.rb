require_relative "stepable"
require_relative "piece"

class Knight < Piece
  include Stepable

  def symbol
    return "♞"
  end
  
  def move_diffs
    diffs = [[-2, 1], [-2, -1], [-1, 2], [-1, -2], [2, 1], [2, -1], [1, 2], [1, -2]]
    return diffs
  end

end