require_relative "piece"
require "singleton"

class NullPiece < Piece
  include Singleton
  attr_reader :symbol
  
  def initialize
    @color = :null
    @symbol = " "
  end

  def empty?
    return true
  end

  def moves
    return []
  end

end