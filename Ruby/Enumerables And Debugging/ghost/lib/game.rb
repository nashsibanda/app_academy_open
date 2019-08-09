require_relative "./game_dict.rb"
require_relative "./player.rb"
require_relative "./ai_player.rb"
require "byebug"

class Game
  attr_reader :players, :losses, :dictionary
  # attr_accessor :fragment

  def initialize(num_of_players, num_of_AI, ghost_word)
    @fragment = ""
    @dictionary = Game_dict
    @players = {}
    # Creates a new player, with a given name, and adds to @players hash
    num_of_players.times do |idx|
      puts "Please enter a name for Player #{idx + 1}: "
      name = gets.chomp
      if name == ""
        @players[("player_" + (idx + 1).to_s).to_sym] = Player.new("Player #{idx+1}")
      else
        @players[("player_" + (idx + 1).to_s).to_sym] = Player.new(name)
      end
    end
    # Creates a new AI Player and adds it to the @players hash
    num_of_AI.times do |idx|
      @players[("player_" + (idx + 1 + num_of_players).to_s).to_sym] = AiPlayer.new
      puts "Created AI Player: #{@players[("player_" + (idx + 1 + num_of_players).to_s).to_sym].name}"
    end
    # Creates an array of the @players hash keys, for referencing
    @player_keys = @players.keys
    @turn = 0
    @losses = Hash.new(0)
    @ghost_word = ghost_word
  end

  def previous_player
    return @players[@player_keys[@turn - 1 % @player_keys.length]] if turn > 0
  end

  def current_player
    return @players[@player_keys[@turn % @player_keys.length]]
  end

  def next_player
    return @players[@player_keys[(@turn + 1)% @player_keys.length]]
  end

  def take_turn(player)
    guess = player.guess
    guess = ai_guess if guess == 12345
    while !valid_play?(guess)
      puts "This is an invalid guess. Try again."
      puts
      puts "Current word fragment is #{@fragment.upcase}"
      guess = player.guess
      guess = ai_guess if guess == 12345
    end
    @fragment << guess
    puts "Current word fragment is #{@fragment.upcase}"
    return true
  end

  def valid_play?(string)
    alpha = ("a".."z").to_a
    if alpha.include?(string) && string.length == 1
      test_fragment = @fragment + string
      @dictionary.each do |word|
        if word.start_with?(test_fragment)
          return true
        end
      end
      false
    else
      false
    end
  end

  def play_round
    take_turn(current_player)
    until @dictionary.include?(@fragment)
      @turn += 1
      take_turn(current_player)
    end
    puts "#{current_player.name} has spelled the word #{@fragment.upcase} and loses the round!"
    @losses[current_player.name] += 1
    return true
  end

  def record(player)
    loss_num = @losses[player.name]
    if loss_num == 0
      return ("-" * @ghost_word.length)
    else
      return (@ghost_word[0..(loss_num-1)] + ("-"* (@ghost_word.length - loss_num)))
    end
  end

  def display_standings
    puts
    puts "Current standings:"
    @players.each do |key, player|
      puts " - #{player.name}: #{record(player)}"
    end
    puts
  end

  def run
    display_standings
    puts "The 'Ghost Word' is '#{@ghost_word}'. Play rounds of the game until a player collects every character of the Ghost Word and loses!"
    puts
    until @losses.any? { |key, value| value == @ghost_word.length }
      @fragment = ""
      play_round
      display_standings
    end
    if @players.length > 2
      puts
      puts "******* #{current_player.name} has been eliminated from the game. *******"
      puts
      @losses.delete(current_player.name)
      @players.delete_if { |key, player| player == current_player }
      @player_keys = @players.keys
      run
    end
    File.delete("lib/game_dict.rb") if File.exist?("lib/game_dict.rb")
    puts
    puts "#{next_player.name} has won the game!"
    puts "Game Over!"
  end

  def ai_guess
    alpha_shuffle = ("a".."z").to_a.shuffle
    winners = []
    alpha_shuffle.each do |letter|
      if valid_play?(letter) && winning_move?(letter)
        winners << letter
      end
    end
    if winners.length > 0
      guess = winners.sample
      p "Winning move!!!"
    else
      guess = alpha_shuffle.sample until valid_play?(guess)
      # p "Losing move!!!"
    end
    return guess
  end

  def winning_move?(letter)
    possible_words = []
    test_fragment = @fragment + letter
    return false if dictionary.include?(test_fragment)
    dictionary.each do |word|
      possible_words << word if word.start_with?(test_fragment)
    end
    if possible_words.all? { |word| word[(test_fragment.length)..-1].length < players.length }
      return true
    else
      return false
    end
    return false
  end

end



game = Game.new(0, 3, "GIL")
game.run