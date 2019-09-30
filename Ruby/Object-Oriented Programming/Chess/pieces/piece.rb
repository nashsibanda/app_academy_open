class Piece

  attr_reader :color
  attr_accessor :position

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

  def valid_moves
    return moves.select { |move| @board[move].color != @color }
  end

  def empty?
    false
  end
  
end