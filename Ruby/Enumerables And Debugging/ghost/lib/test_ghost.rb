require_relative "./dict_writer.rb"

class Ghost
  attr_accessor :player_num, :ghost_word
  
  def initialize
    @player_num = 0
    @ghost_word = ""
  end

  def new_game
    puts "Welcome to Ghost!"
    puts "What language would you like to make words for? Please type one of the following codes."
    Dict.languages.keys.each do |key|
      puts " - " + key.to_s
    end
    Dict.new(gets.chomp.downcase)
    require_relative "./game.rb"
    puts "How many players will be having a go?"
    player_num = gets.chomp.to_i
    if player_num < 2
      puts "Sorry, you need at least two people to play this game. How many people will be playing?"
      player_num = gets.chomp.to_i
    end
    puts "#{player_num.to_s} players, wonderful!"
    puts "The loser of each round will gain a letter to the 'Ghost Word'. This can be a word of any length, although long Ghost Words can lead to very, very long games! I'd suggest a word of around five characters in length."
    puts "What Ghost Word would you like to use for this game?"
    ghost_word = gets.strip.upcase
    puts "OK! This game will have #{player_num} players, and the Ghost Word will be #{ghost_word}. If this is all OK, please enter 'y' below. If not, please enter 'n' to try again."
    if confirm
      game = Game.new(player_num, ghost_word)
      game.run
    else
      new_game
    end
  end

  def new_test_game
    Dict.new("english")
    require_relative "./game.rb"
    Game.new(2, 1, "TEST").run
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

end

Ghost.new.new_test_game