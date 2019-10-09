require_relative 'hand'

class Player
  attr_reader :hand, :pot, :folded
  
  def initialize(deck, pot = 200)
    @hand, @pot, @deck, @folded, @current_bet = Hand.new(deck), pot, deck, false, 0
  end

  def draw
    @hand.draw(@deck.deal)
  end

  def discard
    puts "Choose up to three cards to discard from your hand. Use the numbers on the left to select cards."
    puts "Example: enter '0,3,4' to discard the 0th, 3rd and 4th cards."
    puts
    discard_indexes = gets.chomp.split(",").map(&:to_i)
    @hand.discard(discard_indexes)
  end

  def bet(game_bet)
    if game_bet == @current_bet
      valid_actions = ["raise", "fold", "check"]
      puts "Would you like to raise, fold, or check?"
      puts "Example: to raise by 10, enter 'raise 10'"
      action = gets.chomp.downcase.split
      until valid_actions.include?(action[0])
        puts "Invalid action, please try again."
        puts
        puts "Would you like to raise, fold, or check?"
        puts "Example: to raise by 10, enter 'raise 10'"
        action = gets.chomp.downcase.split
      end
    elsif game_bet > @current_bet
      valid_actions = ["raise", "fold", "call"]
      puts "Would you like to raise, fold, or call?"
      puts "Example: to raise by 10, enter 'raise 10'"
      until valid_actions.include?(action[0])
        puts "Invalid action, please try again."
        puts
        puts "Would you like to raise, fold, or check?"
        puts "Example: to raise by 10, enter 'raise 10'"
        action = gets.chomp.downcase.split
      end
    end
    action[1] = action[1].to_i
    action = [game_bet] + action
    bet_action(*action)
  end

  # private

  def view_cards
    @hand.cards.each_with_index { |card, idx| puts "#{idx}.   #{card}" }
    puts "Current best hand: #{@hand.best_hand_found.keys.first.to_s.split("_").map(&:capitalize).join(" ")} (#{@hand.high_card.first.last.face}-High) - #{@hand.best_hand_found.values.flatten}"
  end

  def bet_action(game_bet, action, amount = 0)
    case action
    when "raise"
      amount += (game_bet - @current_bet)
      @current_bet += amount
    when "fold"
      @folded = true
    when "check"
      @current_bet += amount
    when "call"
      amount = game_bet - @current_bet
      @current_bet = game_bet
    else
      false
    end
    amount
  end

end

deck = Deck.new
player = Player.new(deck)
deck.shuffle!
5.times do
  player.draw
end
player.hand.analyse_hand
player.view_cards
player.discard
player.view_cards
