module Stepable

  def moves
    moves = []
    move_diffs.each do |move_dir|
      move = [(@position[0] + move_dir[0]), (@position[1] + move_dir[1])]
      moves << move
    end
    moves.delete_if do |move|
      return true if move.any? { |coord| coord < 0 || coord >= @board.rows.length }
    end
    moves
  end

  private

  def move_diffs
    raise "Move_DiffsNotImplemented"
  end

end