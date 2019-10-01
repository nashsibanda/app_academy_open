require 'colorize'

class Piece
  attr_accessor :position, :color

  def initialize(color, board, position)
    @color = color
    @board = board
    @position = position
  end

  def to_s
    "#{self.symbol.to_s[0].capitalize.colorize(@color)}"
  end

  def symbol
    :piece
  end

  def available_moves
    return moves.select { |move| @board[move].color != @color }
  end

  def valid_moves
    moves_to_try = available_moves
    moves_to_try.delete_if { |move| move_into_check?(move) }
    return moves_to_try
  end

  def empty?
    false
  end

  private

  def move_into_check?(move)
    cloned_board = @board.clone
    cloned_board.move_piece(@color, @position, move)
    return true if cloned_board.in_check?(@color)
    false
  end

end