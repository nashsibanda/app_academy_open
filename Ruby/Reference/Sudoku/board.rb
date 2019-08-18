require_relative "./tile.rb"

class Board
  attr_reader :board_rows, :board_cols, :board_squares
  
  def initialize(filename)
    @filename = "./puzzles/#{filename}.txt"
    @num_array = File.readlines(@filename, chomp: true).map { |line| line.split("").map(&:to_i) }
    @board_rows = Array.new(@num_array.length) { Array.new(@num_array[0].length) }
    @board_cols = Array.new(@num_array.length) { Array.new(@num_array[0].length) }
    @board_squares = Array.new(@num_array.length) { Array.new(@num_array[0].length) }
    self.populate_board
  end

  def populate_board
    populate_board_rows
    populate_board_cols
    populate_board_squares
  end

  def [](position)
    @board_rows[position[0]][position[1]]
  end

  def []=(position, value)
    @board_rows[position[0]][position[1]].number = value
  end

  def render
    
  end

  private

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
    (0...@board_rows[0].length).each do |c_idx|
      @board_rows.each_with_index do |row, r_idx|
        @board_cols[c_idx][r_idx] = @board_rows[r_idx][c_idx]
      end
    end
  end

  def populate_board_squares
    @board_squares[0] = @board_rows[0][0..2] + @board_rows[1][0..2] + @board_rows[2][0..2]
    @board_squares[1] = @board_rows[0][3..5] + @board_rows[1][3..5] + @board_rows[2][3..5]
    @board_squares[2] = @board_rows[0][6..8] + @board_rows[1][6..8] + @board_rows[2][6..8]
    @board_squares[3] = @board_rows[3][0..2] + @board_rows[4][0..2] + @board_rows[5][0..2]
    @board_squares[4] = @board_rows[3][3..5] + @board_rows[4][3..5] + @board_rows[5][3..5]
    @board_squares[5] = @board_rows[3][6..8] + @board_rows[4][6..8] + @board_rows[5][6..8]
    @board_squares[6] = @board_rows[6][0..2] + @board_rows[7][0..2] + @board_rows[8][0..2]
    @board_squares[7] = @board_rows[6][3..5] + @board_rows[7][3..5] + @board_rows[8][3..5]
    @board_squares[8] = @board_rows[6][6..8] + @board_rows[7][6..8] + @board_rows[8][6..8]
  end

end

temp = Board.new("sudoku1")
p temp.board_squares
puts
puts
p temp.board_rows