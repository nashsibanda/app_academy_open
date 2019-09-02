require_relative "game"

class Minesweeper
  
  def initialize
    @game
    @width
    @bombs
  end

  def new_game
    system("clear")
    puts "***********************************"
    puts
    puts "       Welcome to Minesweeper!     "
    puts
    puts "***********************************"
    sleep(1.5)
    puts
    puts
    puts "How wide would you like the Minesweeper board to be?"
    puts "Please enter a number from 1-3:"
    puts
    puts "1. Small | 2. Medium | 3. Large"
    puts
    @width = gets.chomp.to_i
    until valid_choice?(@width)
      puts "That's not a valid choice! Please choose from 1 to 3."
      @width = gets.chomp.to_i
    end
    @width = width_define(@width)
    puts
    puts "OK, we'll use a board with a width of #{@width} tiles! Now, how hard do you want the game to be?"
    puts "The harder the difficulty, the more bombs will be on the board."
    puts "Please enter a number from 1-3:"
    puts
    puts "1. Easy | 2. Normal | 3. Hard"
    puts
    @bombs = gets.chomp.to_i
    until valid_choice?(@bombs)
      puts "That's not a valid choice! Please choose from 1 to 3."
      @bombs = gets.chomp.to_i
    end
    @bombs = difficulty_define(@bombs)
    puts
    puts "OK, perfect. So we will use a board with a width of #{@width} tiles, with #{@bombs} bombs. Does that sound alright?"
    puts "If so, please enter 'y' below to start. If not, please enter 'n' and let's try this again, shall we?"
    puts
    if confirm
      @game = Game.new(@bombs, @width)
      @game.run
    else
      self.new_game
    end
  end
  
  private

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
  
  def valid_choice?(choice)
    return (1..3).to_a.include?(choice)
  end

  def width_define(choice)
    case choice
    when 1
      return 10
    when 2
      return 20
    when 3
      return 30
    end
  end

  def difficulty_define(choice)
    case choice
    when 1
      return (@width ** 2) / 12
    when 2
      return (@width ** 2) / 9
    when 3
      return (@width ** 2) / 7
    end
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

  def player(player_type)
    case player_type
    when "h"
      @game.play
    when "a"
      @game.solve
    end
  end


end

program = Minesweeper.new
program.new_game