require_relative "board"
require_relative "player"
require "colorize"

class Game
  
  def initialize(bombs, width, height = width)
    @board = Board.new(bombs, width, height)
    @player = Player.new
  end

  def run
    until solved?
      render_board
      turn = player_turn
      position = [turn[0], turn[1]]
      action = turn[2]
      @board[position[0], position[1]].action(action)
      reveal_empty_neighbours(position)
    end
  end

  private

  def solved?
    @board.solved?
  end

  def render_board
    @board.render
  end

  def player_turn
    coords = @player.coords.split(",").map(&:to_i)
    until valid_coords?(coords)
      puts "This is an invalid input. Please try again."
      coords = @player.coords.split(",")
    end
    action = @player.action
    until valid_action?(action)
      puts "This is an invalid input. Please try again."
      action = @player.action
    end
    return [coords[0], coords[1], action]
  end

  def valid_coords?(coords)
    return true if coords.length == 2 && coords[0] < @board.height && coords[1] < @board.width && coords.all? { |num| num >= 0 }
    false
  end

  def valid_action?(action)
    return true if action == "r" || action == "f"
    false
  end

end

temp = Game.new(25, 20)
temp.run