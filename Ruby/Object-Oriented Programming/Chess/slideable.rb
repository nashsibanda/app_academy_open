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
    current_position = @position
  end

  private

  def move_dirs
    directions = HORIZONTAL_DIRS + DIAGONAL_DIRS
    directions
  end

end