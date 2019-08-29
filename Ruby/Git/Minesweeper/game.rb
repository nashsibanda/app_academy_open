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
    return true if coords.length == 2 && coords[]
  end

end