class HumanPlayer
  attr_reader :seen_cards

  def initialize(board)
    @seen_cards = {}
  end

  def remember_card(position, card)
    @seen_cards[position] = card
  end

  def guess(first_guess, matched_card_positions)
    puts "Enter a card position separated by a comma, like this: '0,1'"
    return gets.chomp.split(",").map(&:to_i)
  end
end