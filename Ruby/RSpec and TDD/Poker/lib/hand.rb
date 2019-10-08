require_relative 'deck'

class Hand
  HANDS = {
    royal_flush: "Royal Flush",
    straight_flush: "Straight Flush",
    four_of_a_kind: "Four of a Kind",
    full_house: "Full House",
    flush: "Flush",
    straight: "Straight",
    three_of_a_kind: "Three of a Kind",
    two_pair: "Two Pair",
    one_pair: "One Pair",
    high_card: "High Card"
  }

  attr_reader :deck, :best_hand_found, :high_card
  attr_accessor :cards

  def initialize(deck)
    @cards = []
    @deck = deck
    @best_hand_found
    @high_card
  end

  def draw(card)
    @cards << card
  end

  def analyse_hand
    best_hand
    find_high_card
  end

  def find_high_card
    if low_A_straight?
      highest_value_card = @best_hand_found.first.last.max { |a, b| a.value.first <=> b.value.first }
      high_card = { high_card: highest_value_card }
      @high_card = high_card
      return high_card
    end
    if @best_hand_found.has_key?(:flush) || @best_hand_found.has_key?(:royal_flush) || @best_hand_found.has_key?(:straight)
      highest_value_card = @best_hand_found.first.last.max { |a, b| a.value.last <=> b.value.last }
      high_card = { high_card: highest_value_card }
      @high_card = high_card
      return high_card
    end
    if @best_hand_found.has_key?(:full_house)
      triplet_card = @best_hand_found.first.last.max { |a, b| a.value.last <=> b.value.last }
      pair_card = @best_hand_found.first.last.min { |a, b| a.value.last <=> b.value.last }
      high_card = { high_card: triplet_card, pair: pair_card }
      @high_card = high_card
      return high_card
    end
    if @best_hand_found.has_key?(:four_of_a_kind)
      quad_card = @best_hand_found.first.last.max { |a, b| a.value.last <=> b.value.last }
      kicker = @cards.select { |card| !@best_hand_found.first.last.include?(card) }.max { |a, b| a.value.last <=> b.value.last }
      high_card = { high_card: quad_card, kicker: kicker }
      @high_card = high_card
      return high_card
    end
    if @best_hand_found.has_key?(:three_of_a_kind)
      triplet_card = @best_hand_found.first.last.max { |a, b| a.value.last <=> b.value.last }
      high_kicker = @cards.select { |card| !@best_hand_found.first.last.include?(card) }.max { |a, b| a.value.last <=> b.value.last }
      low_kicker = @cards.select { |card| !@best_hand_found.first.last.include?(card) }.min { |a, b| a.value.last <=> b.value.last }
      high_card = { high_card: triplet_card, high_kicker: high_kicker, low_kicker: low_kicker }
      @high_card = high_card
      return high_card
    end
    if @best_hand_found.has_key?(:two_pair)
      high_pair_card = @best_hand_found.first.last.max { |a, b| a.value.last <=> b.value.last }
      low_pair_card = @best_hand_found.first.last.min { |a, b| a.value.last <=> b.value.last }
      kicker = @cards.select { |card| !@best_hand_found.first.last.include?(card) }.max { |a, b| a.value.last <=> b.value.last }
      high_card = { high_card: high_pair_card, low_pair: low_pair_card, kicker: kicker }
      @high_card = high_card
      return high_card
    end
    if @best_hand_found.has_key?(:one_pair)
      pair_card = @best_hand_found.first.last.max { |a, b| a.value.last <=> b.value.last }
      high_kicker = @cards.select { |card| !@best_hand_found.first.last.include?(card) }.max { |a, b| a.value.last <=> b.value.last }
      low_kicker = @cards.select { |card| !@best_hand_found.first.last.include?(card) }.min { |a, b| a.value.last <=> b.value.last }
      mid_kicker = @cards.select { |card| !@best_hand_found.first.last.include?(card) }.sort_by { |card| card.value.last }[1]
      high_card = { high_card: pair_card, kicker: high_kicker, mid_kicker: mid_kicker, low_kicker: low_kicker }
      @high_card = high_card
      return high_card
    end
  end

  def best_hand
    detected_hands = detect_hands
    highest_value_hand = {}
    catch :found_best_hand do
      HANDS.length.times do |time|
        hand_sym_to_test = HANDS.keys[time]
        if detected_hands.has_key?(hand_sym_to_test)
          highest_value_hand[hand_sym_to_test] = detect_hands[hand_sym_to_test]
          throw :found_best_hand
        end
      end
    end
    @best_hand_found = highest_value_hand
    return highest_value_hand
  end

  def stronger_hand?(opponent_hand)
    opponent_hand_type = opponent_hand.best_hand_found.keys.first
    my_hand_type = @best_hand_found.keys.first
    if opponent_hand_type != my_hand_type
      opponent_hand_rank = HANDS.keys.index(opponent_hand_type)
      my_hand_rank = HANDS.keys.index(my_hand_type)
      return false if my_hand_rank < opponent_hand_rank
      return true
    end
    return true if opponent_hand.high_card[:high_card].value.last > @high_card[:high_card].value.last
    return false if opponent_hand.high_card[:high_card].value.last < @high_card[:high_card].value.last
    if opponent_hand_type == :two_pair
      return false if opponent_hand.high_card[:low_pair].value.last < @high_card[:low_pair].value.last
      return true if opponent_hand.high_card[:low_pair].value.last > @high_card[:low_pair].value.last
    end
    return false if opponent_hand.high_card[:kicker].value.last < @high_card[:kicker].value.last
    return true if opponent_hand.high_card[:kicker].value.last > @high_card[:kicker].value.last
    return false if opponent_hand.high_card[:mid_kicker].value.last < @high_card[:mid_kicker].value.last
    return true if opponent_hand.high_card[:mid_kicker].value.last > @high_card[:mid_kicker].value.last
    return false if opponent_hand.high_card[:low_kicker].value.last < @high_card[:low_kicker].value.last
    return true if opponent_hand.high_card[:low_kicker].value.last > @high_card[:low_kicker].value.last
    
  end

  private

  def detect_hands
    hands = {}
    @cards.sort_by! { |card| card.value }
    hand_faces = Hash.new([])
    @cards.each { |card| hand_faces[card.face] += [card] }
    hand_suits = @cards.map { |card| card.suit }
    # straight detector
    @cards.each do |card1|
      @cards.each do |card2|
        if card2.value.last == (card1.value.first + 1)
          @cards.each do |card3|
            if card3.value.last == (card2.value.last + 1)
              @cards.each do |card4|
                if card4.value.last == (card3.value.last + 1)
                  @cards.each do |card5|
                    if card5.value.last == (card4.value.last + 1)
                      hands[:straight] = [card1, card2, card3, card4, card5]
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    #flush detector
    hands[:flush] = @cards if hand_suits.uniq.size <= 1
    # straight flush detector
    hands[:straight_flush] = hands[:straight] if hands.has_key?(:straight) && hands.has_key?(:flush)
    # royal flush detector
    hands[:royal_flush] = hands[:straight_flush] if hands.has_key?(:straight_flush) && hand_faces.keys.include?("A") && hand_faces.keys.include?("10")
    return hands unless hands.empty?
    # four/three of a kind detector
    four_hand = hand_faces.select { |k,v| v.size == 4 }
    three_hand = hand_faces.select { |k,v| v.size == 3 }
    pairs = hand_faces.select { |k,v| v.size == 2 }
    unless four_hand.empty?
      hands[:four_of_a_kind] = four_hand.first.last
    end
    return hands unless hands.empty?
    unless three_hand.empty?
      hands[:three_of_a_kind] = three_hand.first.last
      # full house detector
      unless pairs.empty?
        hands[:full_house] = @cards
      end
    end
    return hands unless hands.empty?
    # two/one pair detector
    hands[:two_pair] = pairs.values.flatten if pairs.size == 2
    return hands unless hands.empty?
    hands[:one_pair] = pairs.values.flatten if pairs.size == 1
    return hands unless hands.empty?
    # high card default
    hands[:high_card] = @cards
    return hands
  end

  def low_A_straight?
    if @best_hand_found.has_key?(:straight)
      if @best_hand_found.first.last.any? { |card| card.face == "A" }
        if @best_hand_found.first.last.any? { |card| card.face == "2" }
          return true
        end
      end
    end
  end
  
end