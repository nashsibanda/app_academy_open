require_relative "game"

class Minesweeper
  
  def initialize
    @game
    @width
    @bombs
    @game_type
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
    puts "Would you like to start a new game, or load a save file?"
    puts "Please enter 'n' for a new game, or 'l' to load a save file:"
    puts
    @game_type = gets.chomp.downcase
    until valid_game_type?(@game_type)
      puts "That's not a valid choice! Please choose from 1 to 3."
      @game_type = gets.chomp.downcase
    end
    if @game_type == "l"
      load_return = load_game
      unless load_return == "new game"
        return
      end
    end
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
  
  def load_game
    puts "Please select a savefile, or enter 'new game' to start a new game:"
    puts
    saves = Dir.entries("./saves").delete_if{ |file| !file.include?(".yml") }.map!{ |file| file[0...-4] }
    puts saves
    puts
    save_file = gets.chomp.downcase
    puts
    return save_file if save_file == "new game"
    until valid_savefile?(save_file)
      puts "That file doesn't exist! Please select a savefile, or enter 'new game' to start a new game:"
      puts
      save_file = gets.chomp.downcase
      return save_file if save_file == "new game"
    end
    save_file = File.read("./saves/#{save_file}.yml")
    @game = YAML.load(save_file)
    @game.run
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

  def valid_game_type?(game_type)
    return ["n", "l"].include?(game_type)
  end
  
  def valid_choice?(choice)
    return (1..3).to_a.include?(choice)
  end

  def valid_savefile?(save_file)
    File.file?("./saves/#{save_file}.yml")
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


end

program = Minesweeper.new
program.new_game