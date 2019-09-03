require_relative "board"
require_relative "player"
require "colorize"
require "yaml"

class Game
  
  def initialize(bombs, width, height = width)
    @board = Board.new(bombs, width, height)
    @player = Player.new
  end

  def run
    until game_over?
      system("clear")
      render_board
      turn = player_turn
      next if turn == "saved"
      position = [turn[0], turn[1]]
      action = turn[2]
      selected_node = @board[position[0], position[1]]
      if action == "r"
        reveal_empty_neighbours(selected_node)
      else
        selected_node.action(action)
      end
    end
    return true
  end

  
  def solved?
    if @board.solved?
    flag_all_bombs
    render_board
    puts "solved!"
    return true
    end
    false
  end
  
  def lose?
    if @board.lose?
      reveal_all
      render_board
      puts "You lose!"
      return true
    end
    false
  end
  
  def game_over?
    self.solved? || self.lose?
  end

  private

  def render_board
    @board.render
  end

  def reveal_all
    @board.reveal_all
  end

  def flag_all_bombs
    @board.flag_all_bombs
  end

  def player_turn
    coords_input = @player.coords
    return save_game if coords_input == "s"
    coords = coords_input.split(",").map(&:to_i)
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

  def save_game
    puts "Please enter a name for your savefile. Uppercase letters will be converted to lowercase."
    puts
    save_file_name = gets.chomp.downcase
    puts
    existing_saves = Dir.entries("./saves").delete_if{ |file| !file.include?(".yml") }.map!{ |file| file[0...-4] }
    if existing_saves.include?(save_file_name)
      puts "WARNING: A file with this name already exists. Are you sure you want to overwrite this file?"
      puts "Enter 'y' to overwrite, or 'n' to choose a different filename"
      unless confirm
        self.save_game
      end
    end
    puts "Saving game with filename #{save_file_name}....."
    File.open("./saves/#{save_file_name}.yml", "w") { |file| file.write(self.to_yaml) }
    puts "...Done!"
    sleep(1)
    return "saved"
  end

  def confirm
    confirm = gets.chomp.downcase
    case confirm
    when "y"
      return true
    when "n"
      return false
    else
      puts "I'm not sure what that means. Please enter 'y' or 'n' to continue."
      self.confirm
      # false
    end 
  end

  def reveal_empty_neighbours(node)
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

temp = Game.new(3, 8)
temp.run