require_relative "board"
require_relative "player"
require "colorize"
require "byebug"

class Game
  
  def initialize(bombs, width, height = width)
    @board = Board.new(bombs, width, height)
    @player = Player.new
  end

  def run
    until solved?
      # p @board.nodes
      render_board
      turn = player_turn
      position = [turn[0], turn[1]]
      action = turn[2]
      selected_node = @board[position[0], position[1]]
      # selected_node.action(action)
      if action == "r"
        reveal_empty_neighbours(selected_node)
      else
        selected_node.action(action)
      end
    end
    flag_all_bombs
    render_board
    puts "solved!"
    return true
  end

  private

  def solved?
    @board.solved?
  end

  def render_board
    @board.render
  end
  def flag_all_bombs
    @board.flag_all_bombs
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

  def reveal_empty_neighbours(node)
    # debugger
    return if node == nil || node.revealed
    node.action("r")
    return if node.display_value != " - "
    node.neighbours.each do |position|
      next if !valid_coords?(position)
      neighbour = @board[position[0], position[1]]
      reveal_empty_neighbours(neighbour)
    end
  end

end

temp = Game.new(1, 4)
temp.run