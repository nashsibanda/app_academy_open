require_relative 'deck'
require_relative 'player'

class Game
  
  def initialize(no_of_players, starting_stake = 200)
    @deck = Deck.new
    @deck.shuffle!
    @players = {}
    @unfolded_players
    add_players(no_of_players, starting_stake)
    @current_player
    @pot = 0
    @game_bet = 0
  end

  def play
    system("clear")
    until @players.size == 1
      deal_cards
      betting_round
      fold_players
      discard_round
      deal_cards
      betting_round
      fold_players
      find_winner
      sleep(3)
      reset_all_players
      @deck.rebuild_deck
    end
    puts "#{@players.keys.first} wins the whole game! They go home with $#{@players.values.first.pot}!!"
  end

  private

  def discard_round
    @unfolded_players.each do |key, player|
      puts "=================="
      puts "DISCARD ROUND!"
      puts "Pot: $#{@pot}"
      puts "Current player: #{key} - $#{player.pot} available."
      puts
      player.discard
    end
  end

  def deal_cards
    until @unfolded_players.all? { |key, player| player.cards.size == 5 }
      @unfolded_players.each do |key, player|
        next if player.cards.size == 5
        player.draw
      end
    end
  end
  
  def betting_round
    @game_bet = 0
    @unfolded_players.each do |key, player|
      player.reset_current_bet
      puts "=================="
      puts "BETTING ROUND!"
      puts "Pot: $#{@pot}"
      puts
      puts "Current player: #{key} - $#{player.pot} available."
      puts "The current highest bet is $#{@game_bet}"
      puts "You need to add $#{(@game_bet - player.current_bet)} to continue, or fold."
      puts
      change = player.bet(@game_bet)
      until change != false
        puts
        puts "Current player: #{key} - $#{player.pot} available."
        puts "The current highest bet is $#{@game_bet}"
        puts "You need to add $#{(@game_bet - player.current_bet)} to continue, or fold."
        puts
        change = player.bet(@game_bet)
      end
      @pot += change
      @game_bet = player.current_bet if @game_bet < player.current_bet
    end
    until @unfolded_players.all? { |key, player| player.current_bet == @game_bet || player.folded }
    @unfolded_players.each do |key, player|
        next if player.folded
        puts "=================="
        puts "BETTING ROUND!"
        puts "Pot: $#{@pot}"
        puts
        puts "Current player: #{key}"
        puts "The current highest bet is #{@game_bet}"
        puts "You need to add #{(@game_bet - player.current_bet)} to continue, or fold."
        puts
        change = player.bet(@game_bet)
        until change != false
          puts "Current player: #{key}"
          puts "The current highest bet is #{@game_bet}"
          puts "You need to add #{(@game_bet - player.current_bet)} to continue, or fold."
          puts
          change = player.bet(@game_bet)
        end
        @pot += change
        @game_bet = player.current_bet if @game_bet < player.current_bet
      end
    end
  end

  def fold_players
    @unfolded_players.delete_if { |key, player| player.folded }
  end

  def add_players(no_of_players, starting_stake)
    no_of_players.times do |time|
      @players["Player #{(time + 1)}"] = Player.new(@deck, starting_stake)
    end
    @unfolded_players = @players.dup
  end

  def reset_all_players
    @players.delete_if { |key, player| player.pot == 0 }
    @players.each do |key, player|
      player.discard("all")
      player.reset_current_bet
      player.folded = false
    end
    @unfolded_players = @players.dup
    @pot = 0
  end

  def find_winner
    return "Everyone folded!" if @unfolded_players.empty?
    if @unfolded_players.size == 1
      puts "#{@unfolded_players.keys.first} wins! They've won $#{@pot}!"
      distribute_winnings(@pot)
    else
      until @unfolded_players.size == 1
        test_hand = @unfolded_players.values.first.hand
        opp_hand = @unfolded_players.values.last.hand
        if test_hand.stronger_hand?(opp_hand) == true
          arr_players = @unfolded_players.to_a
          arr_players.shift
          @unfolded_players = arr_players.to_h
        elsif test_hand.stronger_hand?(opp_hand) == false
          arr_players = @unfolded_players.to_a
          arr_players.pop
          @unfolded_players = arr_players.to_h
        elsif test_hand.stronger_hand?(opp_hand) == "draw" && @unfolded_players.size == 2
          puts "It's a draw, between #{@unfolded_players.keys.first} and #{@unfolded_players.keys.last}. They split $#{@pot}, getting $#{(@pot / 2)} each."
          distribute_winnings((@pot / 2))
        else
          @unfolded_players = @unfolded_players.to_a.shuffle.to_h
        end
      end
      puts "#{@unfolded_players.keys.first} wins! They've won $#{@pot}!"
      distribute_winnings(@pot)
    end
  end

  def distribute_winnings(amount)
    @unfolded_players.each { |key, player| player.receive_winnings(amount) }
  end

end

game = Game.new(3, 50)
game.play