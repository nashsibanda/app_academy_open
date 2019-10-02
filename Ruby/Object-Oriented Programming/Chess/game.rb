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

  def play
    until checkmate?
      begin
        @current_player.make_move(@board)
        switch_player
      rescue StandardError => e
        puts e.message
        sleep(2)
      end
    end
    @display.render
    switch_player
    puts "#{@current_player.color.to_s.capitalize} wins!"
  end

  private

  def switch_player
    case @current_player
    when @player1
      @current_player = @player2
    when @player2
      @current_player = @player1
    end
  end

  def checkmate?
    return true if @board.checkmate?(@player1.color) || @board.checkmate?(@player2.color)
    false
  end

end

game = Game.new
game.play