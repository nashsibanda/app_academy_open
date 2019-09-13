class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new }
    @player1, @player2 = name1, name2
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
    hand, i, selected_cup, skipped_cup = [], 1, @cups[start_pos], skipped_cup_index(current_player_name)
    selected_cup.length.times { |x| hand.push(selected_cup.shift) }
    hand.length.times do |time|
      cup_index = (start_pos + i) % @cups.length
      if cup_index != skipped_cup
        @cups[cup_index].push(hand.shift) 
        i += 1
      else
        @cups[(cup_index + 1) % @cups.length].push(hand.shift) 
        i += 2
      end
    end
    render
    ending_cup_idx = (start_pos + i - 1) % @cups.length
    ending_cup_idx == (start_pos + i) % @cups.length if ending_cup_idx == 13 || 6
    return next_turn(ending_cup_idx, current_player_name)
  end

  def next_turn(ending_cup_idx, current_player)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return :prompt if ending_cup_idx == points_cup_index(current_player)
    return :switch if @cups[ending_cup_idx].length == 1
    return ending_cup_idx if @cups[ending_cup_idx].length > 1
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    if @cups[0..5].all?(&:empty?) || @cups[7..12].all?(&:empty?)
      return true
    end
    false
  end

  def winner
    if @cups[6].length == @cups[13].length
      return :draw
    end
    return @cups[6].length > @cups[13].length ? @player1 : @player2
  end

  def skipped_cup_index(current_player)
    case current_player
    when @player1
      return 13
    when @player2
      return 6
    end
  end

  def points_cup_index(current_player)
    case current_player
    when @player1
      return 6
    when @player2
      return 13
    end
  end

end
