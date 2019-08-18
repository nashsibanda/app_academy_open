class HumanPlayer
  attr_reader :seen_cards

  def initialize
    @seen_cards = {}
  end

  def remember_card(position, card)
    @seen_cards[position] = card
  end

  def guess(board, first_guess)
    puts "Enter a card position separated by a comma, like this: '0,1'"
    return gets.chomp.split(",").map(&:to_i)
  end
end