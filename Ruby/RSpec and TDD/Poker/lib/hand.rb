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

  attr_reader :deck, :best_hand
  attr_accessor :cards

  def initialize(deck)
    @cards = []
    @deck = deck
    # @best_hand
  end

  def draw(card)
    @cards << card
  end

  def find_best_hand
    
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
    return highest_value_hand
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
  
end