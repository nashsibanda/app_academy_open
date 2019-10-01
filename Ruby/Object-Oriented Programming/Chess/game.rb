require_relative "display"
require_relative "human_player"

class Game
  
  def initialize
    @board = Board.new
    @player1, @player2 = HumanPlayer.new(:white, @board), HumanPlayer.new(:black, @board)
  end

end