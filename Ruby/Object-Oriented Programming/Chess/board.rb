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

  def move_piece(color, start_pos, end_pos)
    piece_in_hand = self[start_pos]
    if piece_in_hand.is_a?(NullPiece)
      raise "TriedToMoveNullPiece"
    elsif !piece_in_hand.valid_move?
      raise "InvalidMoveAttempted"
    end
    self[start_pos], self[end_pos] = NullPiece.instance, self[start_pos]
  end

  private

  def populate_pieces
    @rows.each_with_index do |row, r_idx|
      if r_idx.between?(0,1) || r_idx.between?(6,7)
        row.each_index do |s_idx|
          position = [r_idx, s_idx]
          self[position] = Piece.new(:white, self, position) if r_idx.between?(0,1)
          self[position] = Piece.new(:black, self, position) if r_idx.between?(6,7)
        end
      end
    end
  end

  def valid_move?
    return true
  end

end

temp = Board.new
p temp
temp.move_piece(:white, [1, 0], [4, 0])
p temp