require 'colorize'

class Piece

  attr_reader :color
  attr_accessor :position

  def initialize(color, board, position)
    @color = color
    @board = board
    @position = position
  end

  def inspect
    "#{self.symbol.to_s[0].capitalize.colorize(nicer_color)}"
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

  private

  def nicer_color
    case @color
    when :white
      :yellow
    when :black
      :blue
    when :null
      :gray
    end
  end
  
end