require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    case @next_mover_mark
    when :x
      mark = :o
    when :o
      mark = :x
    end
    children = []
    @board.rows.each_with_index do |row, r_idx|
      row.each_with_index do |spot, s_idx|
        position = [r_idx, s_idx]
        if @board.empty?(position)
          new_node = TicTacToeNode.new(Board.new(@board.dup), mark, position)
          children << new_node
        end
      end
    end
    return children
  end
end
