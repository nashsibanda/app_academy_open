class Pawn < Piece
  
  def symbol
    return :pawn
  end

  def move_dirs
    
  end

  private

  def forward_dir
    case @color
    when :white
      return 1
    when :black
      return -1
    end    
  end

  def forward_steps
    if (@color == :white && @position[0] == 1) || (@color == :black && @position[0] == 6)
      return 2
    end
    return 1
  end

  def side_attacks
    side_attacks = []
    left, right = [(@position[0] + forward_dir), (@position - 1)], [(@position[0] + forward_dir), (@position + 1)]
    side_attacks << left if !@board[left].empty? && @board[left].color != @color
    side_attacks << right if !@board[right].empty? && @board[right].color != @color
    side_attacks
  end

end