require_relative "./board.rb"
require_relative "./player.rb"

class Game
  
  def initialize(filename)
    @board = Board.new(filename)
    @player = Player.new
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
    puts "Puzzle solved!"
  end

end

temp = Game.new("sudoku1_almost")
temp.play