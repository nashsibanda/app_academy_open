class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, idx|
      unless idx == 6 || idx == 13
        4.times { cup << :stone }
      end
    end
  end

  def valid_move?(start_pos)
    if start_pos >= 0 && start_pos <= @cups.length
      if @cups[start_pos].any?
        return true
      else
        raise "Starting cup is empty"
      end
    else
      raise "Invalid starting cup"
    end
      
  end

  def make_move(start_pos, current_player_name)
    hand, i, selected_cup = [], 1, @cups[start_pos]
    selected_cup.length.times { |x| hand.push(selected_cup.shift) }
    hand.length.times do |time|
      next_cup = @cups[(start_pos + i) % @cups.length]
      next_cup.push(hand.shift)
      i += 1
    end
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
