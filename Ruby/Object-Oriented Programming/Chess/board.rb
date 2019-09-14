require_relative "piece_kit"

class Board
  # attr_reader :rows
  
  def initialize
    @rows = Array.new (8) { Array.new (8) {NullPiece.new} }
    # @sentinel = NullPiece.new
  end

end

temp = Board.new
p temp