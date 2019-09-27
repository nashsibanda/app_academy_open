class Piece

  def initialize(color, board, position)
    @color = color
    @board = board
    @position = position
  end

  def inspect
    "#{@color.to_s.capitalize} #{self.symbol.to_s.capitalize}"
  end

  def symbol
    :piece
  end

  def valid_move?
    true    
  end

  def empty?
    false
  end
  
end