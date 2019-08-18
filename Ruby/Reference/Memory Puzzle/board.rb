require_relative "./card.rb"

class Board
  attr_reader :board, :valid_coords

  @@all_card_values = ("A".."Z").to_a

  def initialize(pairs)
    @pairs = pairs
    @board = self.make_board(@pairs)
    @valid_coords
    self.populate
  end

  def [](position)
    @board[position[0]][position[1]]
  end

  def []=(position, value)
    @board[position[0]][position[1]] = value
  end

  def make_board(pairs)
    case pairs
    when 6
      Array.new(3) { Array.new(4) }
    when 8
      Array.new(4) { Array.new(4) }
    when 10
      Array.new(4) { Array.new(5) }
    when 12
      Array.new(4) { Array.new(6) }
    when 15
      Array.new(5) { Array.new(6) }
    when 18
      Array.new(6) { Array.new(6) }
    when 21
      Array.new(6) { Array.new(7) }
    else
      raise "Please select one of the following numbers of pairs: 6, 8, 10, 12, 15, 18, 21"
    end
  end

  def populate
    card_values = @@all_card_values.sample(@pairs)
    card_values = card_values.zip(card_values).flatten
    row_indexes = (0...@board.length).to_a.shuffle
    col_indexes = (0...@board[0].length).to_a.shuffle
    positions = []
    row_indexes.each do |r_idx|
      col_indexes.each do |c_idx|
        positions.push([r_idx, c_idx])
      end
    end
    @valid_coords = positions
    positions.shuffle!
    i = 0
    while i < card_values.length
      @board[positions[i][0]][positions[i][1]] = Card.new(card_values[i], positions[i])
      i += 1
    end
  end

  def game_over?
    over = true
    @board.each do |row|
      row.each do |card|
        over = false if card.matched == false
      end
    end
    return over
  end

  def display_board
    card_board = self.make_board(@pairs)
    @board.each_with_index do |row, r_idx|
      row.each_with_index do |spot, s_idx|
        if !spot.matched && spot.facing == "down"
          card_board[r_idx][s_idx] = " * "
        elsif spot.matched || spot.facing == "up"
          card_board[r_idx][s_idx] = " #{spot.face_value} "
        end
      end
    end
    puts grid_helper(card_board).map(&:join)
  end

  private

  def grid_helper(card_board)
    board_rows = card_board.length
    board_cols = card_board[0].length
    top_row = [" "]
    (0...board_cols).each do |num|
      top_row << " #{num.to_s} "
    end
    card_board.unshift(top_row)
    (1..board_rows).each do |num|
      card_board[num].unshift(num - 1)
    end
    return card_board
  end

end

# temp = Board.new(10)
# pos = [0, 1]
# temp.display_board
# puts temp[pos].face_value
# # puts temp.board
# temp[pos].flip("up")
# puts temp.display_board.map(&:join)