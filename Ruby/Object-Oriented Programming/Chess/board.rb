require_relative "piece_kit"

class Board
  attr_accessor :rows
  
  def initialize
    @rows = Array.new (8) { Array.new (8) { NullPiece.instance } }
    @sentinel = NullPiece.instance
    populate_pieces
    # debug_add_knight
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

  def valid_pos?(pos)
    return true if self[pos]
    false
  end

  def clone
    cloned_board = Board.new
    cloned_board.rows.each_with_index do |row, r_idx|
      row.each_with_index do |spot, s_idx|
        c_pos = [r_idx, s_idx]
        orig_piece = self[c_pos]
        c_class, c_color, c_position = orig_piece.class, orig_piece.color, orig_piece.position
        next if c_class == NullPiece
        cloned_board[c_pos] = c_class.new(c_color, cloned_board, c_position)
      end
    end
    cloned_board
  end

  private

  def populate_pieces
    @rows.each_with_index do |row, r_idx|
      if r_idx == 0
        row.each_index do |s_idx|
          position, color = [r_idx, s_idx], :white
          self[position] = Rook.new(color, self, position) if s_idx == 0 || s_idx == 7
          self[position] = Knight.new(color, self, position) if s_idx == 1 || s_idx == 6
          self[position] = Bishop.new(color, self, position) if s_idx == 2 || s_idx == 5
          self[position] = King.new(color, self, position) if s_idx == 3
          self[position] = Queen.new(color, self, position) if s_idx == 4
        end
      elsif r_idx == 1
        row.each_index do |s_idx|
          position, color = [r_idx, s_idx], :white
          self[position] = Pawn.new(color, self, position)
        end
      elsif r_idx == 6
        row.each_index do |s_idx|
          position, color = [r_idx, s_idx], :black
          self[position] = Pawn.new(color, self, position)
        end
      elsif r_idx == 7
        row.each_index do |s_idx|
          position, color = [r_idx, s_idx], :black
          self[position] = Rook.new(color, self, position) if s_idx == 0 || s_idx == 7
          self[position] = Knight.new(color, self, position) if s_idx == 1 || s_idx == 6
          self[position] = Bishop.new(color, self, position) if s_idx == 2 || s_idx == 5
          self[position] = King.new(color, self, position) if s_idx == 3
          self[position] = Queen.new(color, self, position) if s_idx == 4
        end
      end
    end
  end

  def valid_move?
    return true
  end

  # def debug_add_knight
  #   pos = [2, 3]
  #   self[pos] = Queen.new(:white, self, pos)
  #   pos2 = [1, 1]
  #   pos3 = [2, 2]
  #   self[pos2] = Pawn.new(:white, self, pos2)
  #   self[pos3] = Pawn.new(:black, self, pos3)
  # end

end

# temp = Board.new
# temp.rows.each { |row| puts row.map { |piece| piece.inspect }.join(" ") }
# pos = [0, 6]
# endpos = [2, 7]
# pawnpos = [1, 1]
# # p temp[pos].valid_moves
# # p temp[pos].moves
# # temp.move_piece(:white, pos, endpos)
# # # p temp
# # p temp[endpos].moves
# # temp.move_piece(:white, endpos, pos)
# p temp[pos]
# p temp[pos].valid_moves
# temp.move_piece(:white, pos, endpos)
# p temp[pos]
# p temp[endpos]