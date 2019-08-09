require_relative "board"
require_relative "player"

class Battleship
  attr_reader :board, :player

  def initialize(n)
    @player = Player.new
    @board = Board.new(n)
    @remaining_misses = (n * n) / 2
    @width = n
  end

  def start_game
    @board.place_random_ships
    puts "There are " + (@board.size / 4).to_s + " ships on the board"
    @board.print
  end

  def lose?
    if @remaining_misses <= 0
      puts "you lose"
      return true
    end
    false
  end

  def win?
    if @board.num_ships == 0
      puts "you win"
      return true
    end
    false
  end

  def game_over?
    return true if win? || lose?
    false
  end

  def turn
    position = @player.get_move
    if position.any? { |ele| ele >= @width }
      puts "Not a valid coordinate. Please try again."
      position = @player.get_move
    end
    if !@board.attack(position)
      @remaining_misses -= 1
    end
    @board.print
    puts @remaining_misses.to_s
  end
end
