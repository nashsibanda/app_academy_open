require_relative "./tile.rb"

class Board
  attr_reader :board_rows
  
  def initialize(filename)
    @filename = "./puzzles/#{filename}.txt"
    @num_array = File.readlines(@filename, chomp: true).map { |line| line.split("").map(&:to_i) }
    @board_rows = Array.new(@num_array.length) { Array.new(@num_array[0].length) }
    @board_cols = Array.new(@num_array.length) { Array.new(@num_array[0].length) }
    @board_squares = Array.new(@num_array.length) { Array.new(@num_array[0].length) }
    self.populate_board
  end

  def populate_board
    self.populate_board_rows
    self.populate_board_cols
  end

  def populate_board_rows
    @num_array.each_with_index do |row, r_idx|
      row.each_with_index do |num, n_idx|
        given = true
        given = false if num == 0
        position = [r_idx, n_idx]
        @board_rows[r_idx][n_idx] = Tile.new(num, given, position)
      end
    end
  end

  def populate_board_cols
    
  end

end

temp = Board.new("sudoku1")
p temp.board_rows