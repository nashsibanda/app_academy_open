require_relative "piece"

class Pawn < Piece
  
  def symbol
    return "♟"
  end

  def moves
    return forward_steps + side_attacks
  end

  private

  def at_start_row?
    if @color == :white && @position[0] == 1
      return true
    end
    false
  end

  def forward_dir
    case @color
    when :white
      return 1
    when :black
      return -1
    end    
  end

  def forward_steps
    forward_steps = []
    step, double_step = [(@position[0] + forward_dir), @position[1]], [(@position[0] + forward_dir + forward_dir), @position[1]]
    if @board[step].empty?
      forward_steps << step
      if at_start_row? && @board[double_step].empty?
        forward_steps << double_step
      end
    end
    return forward_steps
  end

  def side_attacks
    side_attacks = []
    left, right = [(@position[0] + forward_dir), (@position[1] - 1)], [(@position[0] + forward_dir), (@position[1] + 1)]
    if @board.valid_pos?(left)
      side_attacks << left if !@board[left].empty? && @board[left].color != @color
    end
    if @board.valid_pos?(right)
      side_attacks << right if !@board[right].empty? && @board[right].color != @color
    end
    side_attacks
  end

end