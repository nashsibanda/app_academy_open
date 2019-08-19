require_relative "./game.rb"

class MemoryPuzzle
  
  def initialize
    @pairs
    @player_type
    self.new_game
  end

  def new_game
    system("clear")
    puts "***********************************"
    puts
    puts "     Welcome to Memory Puzzle!     "
    puts
    puts "***********************************"
    sleep(1.5)
    puts
    puts
    puts "How many pairs would you like to search for?"
    puts "Please select one of the following numbers of pairs: 6, 8, 10, 12, 15, 18, 21"
    puts
    @pairs = gets.chomp.to_i
    until valid_pair_num?(@pairs)
      puts "Please select one of the following numbers of pairs: 6, 8, 10, 12, 15, 18, 21"
      @pairs = gets.chomp.to_i
    end
    puts "Great, let's look for #{@pairs} pairs! Now, will you be solving this, or shall the computer do it?"
    puts "Enter 'h' for a human player (that's you, by the way), or 'a' for an AI player."
    puts
    @player_type = gets.chomp.downcase
    until valid_player_type?(@player_type)
      puts "Enter 'h' for a human player (that's you, by the way), or 'a' for an AI player."
      @player_type = gets.chomp.downcase
    end
    puts "OK, perfect. So I will make a puzzle with #{@pairs} pairs of hidden cards, and it will be solved by #{player_type_label(@player_type)} player. Does that sound alright?"
    puts "If so, please enter 'y' below to start. If not, please enter 'n' and let's try this again, shall we?"
    if confirm
      game = Game.new(@pairs, @player_type)
      game.play
    else
      self.new_game
    end
  end

  def valid_pair_num?(pairs)
    valid_nums = [6, 8, 10, 12, 15, 18, 21]
    return valid_nums.include?(pairs)
  end
  
  def valid_player_type?(player_type)
    valid_types = ["a", "h"]
    return valid_types.include?(player_type)
  end
  
  def player_type_label(player_type)
    case player_type
    when "a"
      return "an AI"
    when "h"
      return "a Human"
    end
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
end

MemoryPuzzle.new