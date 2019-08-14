require_relative "./card.rb"

class Board
  attr_reader :board

  @@all_card_values = ("A".."Z").to_a

  def initialize(pairs)
    @pairs = pairs
    @board = Array.new(@pairs / 2) { Array.new(@pairs / 2) }
  end

  def [](position)
    @board[position[0]][position[1]]
  end

  def []=(position, value)
    @board[position[0]][position[1]] = value
  end

  def populate
    card_values = @@all_card_values.sample(@pairs)
    card_values = card_values.zip(card_values).flatten
    row_indexes = (0...(@pairs / 2)).to_a.shuffle
    col_indexes = (0...(@pairs / 2)).to_a.shuffle
    positions = []
    row_indexes.each do |r_idx|
      col_indexes.each do |c_idx|
        positions.push([r_idx, c_idx])
      end
    end
    positions.shuffle!
    i = 0
    while i < card_values.length
      @board[positions[i][0]][positions[i][1]] = Card.new(card_values[i], positions[i])
      i += 1
    end
  end

  def print_board
    display = Array.new([])
    @board.each_with_index do |row, r_idx|
      row.each_with_index do |spot, s_idx|
        display[r_idx] << spot.face_value
      end
    end
    return display
  end

end

temp = Board.new(8)
temp.populate
pos = [0, 1]
p temp.print_board
puts temp[pos].face_value