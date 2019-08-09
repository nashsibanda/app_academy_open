require_relative "./dict_writer.rb"

class Ghost
  attr_accessor :player_num, :ghost_word
  
  def initialize
    @players_num = 0
    @ghost_word = ""
  end

  def new_game
    puts
    puts
    puts "******* Welcome to Ghost! *******"
    puts
    puts
    puts "What language would you like to make words for? Please type one of the following codes."
    Dict.languages.keys.each do |key|
      puts " - " + key.to_s
    end
    Dict.new(gets.chomp.downcase)
    require_relative "./game.rb"
    puts
    puts "How many human players will be having a go?"
    humans_input = gets.chomp.to_i
    humans_num = player_numbers(humans_input)
    @players_num += humans_num
    puts
    puts "How many AI players would you like?"
    ai_input = gets.chomp.to_i
    ai_num = player_numbers(ai_input)
    puts
    puts "*** So that's #{humans_num} human player/s and #{ai_input} AI player/s. What a match-up! ***"
    puts
    puts "The loser of each round will gain a letter to the 'Ghost Word'. This can be a word of any length, although long Ghost Words can lead to very, very long games! I'd suggest a word of around five characters in length."
    puts
    puts "What Ghost Word would you like to use for this game?"
    ghost_word = gets.strip.upcase
    puts
    puts "OK! This game will have #{player_num} players, and the Ghost Word will be #{ghost_word}. If this is all OK, please enter 'y' below. If not, please enter 'n' to try again."
    if confirm
      game = Game.new(humans_num, ai_num, ghost_word)
      game.run
    else
      new_game
    end
  end

  def confirm
    confirm = gets.chomp.downcase
    if confirm == "y"
      true
    elsif confirm == "n"
      false
    else
      puts "I'm not sure what that means. Please enter either 'y' or 'n' to continue."
      self.confirm
      false
    end
  end

  def player_numbers(num)
    if num > 1 
      puts "Great, #{num} players!"
      return num
    elsif num == 1 || @players_num > 0
      puts "OK, just #{num} player!"
      return num
    else
      puts "You need at least one human player for this game (ideally yourself)! How many humans will be playing?"
      reattempt = gets.chomp.to_i
      return player_numbers(reattempt)
    end
  end

end

start_game = Ghost.new
start_game.new_game