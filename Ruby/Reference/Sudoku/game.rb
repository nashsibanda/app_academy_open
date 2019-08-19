require_relative "./board.rb"
require_relative "./player.rb"

class Game
  attr_reader :board
  
  def initialize(filename)
    @board = Board.new(filename)
    @player = Player.new
    @solver = Solver.new(@board)
  end

  def play
    until @board.solved?
      @board.render
      player_move = @player.input
      player_move_position = [player_move[0], player_move[1]]
      player_move_value = player_move[2]
      @board[player_move_position] = player_move_value
    end
    @board.render
    puts " * * * Puzzle solved! * * *".colorize(:green)
  end

  def solve
    @solver.solve
  end

end

# temp = Game.new("sudoku3")
# temp.solve
# pos = [0, 3]
# p temp.board[0]