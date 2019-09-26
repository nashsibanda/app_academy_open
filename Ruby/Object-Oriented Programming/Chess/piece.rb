class Piece

  def initialize(color, board, position)
    @color = color
    @board = board
    @position = position
  end

  def inspect
    "#{@color.to_s.capitalize} Piece"
  end

  def valid_move?
    return true    
  end
  
end