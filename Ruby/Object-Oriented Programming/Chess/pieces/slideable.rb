module Slideable
  
  HORIZONTAL_DIRS = [[-1, 0], [0, -1], [1, 0], [0, 1]]
  DIAGONAL_DIRS = [[-1, -1], [1, -1], [-1, 1], [1, 1]]

  def horizontal_dirs
    HORIZONTAL_DIRS    
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    moves = []
    move_dirs.each do |move_dir|
      moves += grow_unblocked_moves_in_dir(move_dir[0], move_dir[1])
    end
    moves.uniq
  end

  private

  def move_dirs
    raise "Move_DirsNotImplemented"
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    current_position = @position
    new_position = [(@position[0] + dx), (@position[1] + dy)]
    unblocked_moves = []
    until !@board.valid_pos?(new_position) || !@board[new_position].is_a?(Piece) || new_position[0] < 0 || new_position[1] < 0
      unblocked_moves << new_position
      break if !@board[new_position].empty?
      new_position = [(new_position[0] + dx), (new_position[1] + dy)]
    end
    unblocked_moves
  end


end