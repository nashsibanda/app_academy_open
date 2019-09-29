require_relative "piece_kit"

class Board
  attr_reader :rows
  
  def initialize
    @rows = Array.new (8) { Array.new (8) { NullPiece.instance } }
    @sentinel = NullPiece.instance
    populate_pieces
    debug_add_knight
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
    elsif !piece_in_hand.valid_moves.include?(end_pos)
      raise "InvalidMoveAttempted"
    end
    self[start_pos], self[end_pos] = NullPiece.instance, self[start_pos]
    self[end_pos].position = end_pos
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

  def debug_add_knight
    pos = [2, 3]
    self[pos] = Queen.new(:white, self, pos)
    pos2 = [1, 1]
    pos3 = [2, 2]
    self[pos2] = Pawn.new(:white, self, pos2)
    self[pos3] = Pawn.new(:black, self, pos3)
  end

end

temp = Board.new
temp.rows.each { |row| puts row.map { |piece| piece.inspect }.join(" ") }
pos = [2, 3]
endpos = [6, 7]
pawnpos = [1, 1]
# p temp[pos].valid_moves
# p temp[pos].moves
# temp.move_piece(:white, pos, endpos)
# # p temp
# p temp[endpos].moves
# temp.move_piece(:white, endpos, pos)
p temp[pawnpos].move_dirs