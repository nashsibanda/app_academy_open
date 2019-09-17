require_relative "piece_kit"

class Board
  attr_reader :rows
  
  def initialize
    @rows = Array.new (8) { Array.new (8) { NullPiece.instance } }
    @sentinel = NullPiece.instance
    populate_pieces
  end

  def [](position)
    @rows[position[0]][position[1]]
  end

  def []=(position, value)
    @rows[position[0]][position[1]] = value
  end

  private

  def populate_pieces
    @rows.each_with_index do |row, r_idx|
      if r_idx.between?(0,1) || r_idx.between?(6,7)
        row.each_index { |s_idx| @rows[r_idx][s_idx] = Piece.new }
      end
    end
  end

end

temp = Board.new
p temp