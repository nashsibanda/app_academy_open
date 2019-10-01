require_relative "board"
require_relative "display"
require_relative "player_kit"

class Game
  attr_reader :display
  
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @player1, @player2 = HumanPlayer.new(:white, @display), HumanPlayer.new(:black, @display)
    @current_player = @player1
  end

end

game = Game.new
game.display.render_loop