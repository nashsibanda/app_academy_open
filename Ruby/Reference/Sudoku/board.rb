require_relative "./tile.rb"
require_relative "./solver.rb"

class Board
  attr_reader :board_rows, :board_cols, :board_squares, :changeable_tiles, :parent_tiles, :child_tiles
  
  def initialize(filename)
    @filename = "./puzzles/#{filename}.txt"
    @num_array = File.readlines(@filename, chomp: true).map { |line| line.split("").map(&:to_i) }
    @board_rows = Array.new(@num_array.length) { Array.new(@num_array[0].length) }
    @board_cols = Array.new(@num_array.length) { Array.new(@num_array[0].length) }
    @board_squares = Array.new(@num_array.length) { Array.new(@num_array[0].length) }
    @changeable_tiles = []
    @parent_tiles = {}
    populate_board
    @child_tiles = @parent_tiles.invert
  end

  def [](position)
    return @board_rows[position[0]] if position.is_a?(Integer)
    @board_rows[position[0]][position[1]]
  end

  def []=(position, value)
    @board_rows[position[0]][position[1]].number = value
  end

  def render
    display_board = Array.new(@num_array.length) { Array.new(@num_array[0].length) }
    @board_rows.each_with_index do |row, r_idx|
      row.each_with_index do |tile, t_idx|
        display_board[r_idx][t_idx] = @board_rows[r_idx][t_idx].to_s
      end
    end
    puts grid_helper(display_board).map(&:join)
  end

  def solved?
    return true if dimension_solved?(@board_rows) && dimension_solved?(@board_cols) && dimension_solved?(@board_squares)
    false
  end

  def unique?(tile)
    return false if tile.number == 0
    tile_row = @board_rows.select { |row| row.include?(tile) }.flatten
    tile_column = @board_cols.select { |col| col.include?(tile) }.flatten
    tile_square = @board_squares.select { |square| square.include?(tile) }.flatten
    tile_row.each do |row_tile|
      if tile != row_tile && tile.number == row_tile.number
        return false
      end
    end
    tile_column.each do |column_tile|
      if tile != column_tile && tile.number == column_tile.number
        return false
      end
    end
    tile_square.each do |square_tile|
      if tile != square_tile && tile.number == square_tile.number
        return false
      end
    end
    true
  end
  
  private
  
  def dimension_solved?(tile_array)
    tile_array.all? do |array|
      values = array.map { |tile| tile.number }
      if values == values.uniq && !values.include?(0)
        true
      else
        return false
      end
    end
    return true
  end

  def grid_helper(display_board)
    board_rows = display_board.length
    board_cols = display_board[0].length
    top_row = [" "]
    (0...board_cols).each do |num|
      top_row << " #{num.to_s.colorize(:red)} "
    end
    display_board.unshift(top_row)
    (1..board_rows).each do |num|
      display_board[num].unshift((num - 1).to_s.colorize(:red))
    end
    return display_board
  end
  
  def populate_board
    populate_board_rows
    populate_board_cols
    populate_board_squares
    populate_changeable_tiles_and_parents
  end

  def populate_changeable_tiles_and_parents
    @board_rows.each do |row|
      row.each do |tile|
        if !tile.given
          @changeable_tiles << tile
        end
      end
    end
    (1...@changeable_tiles.length).each { |idx| @parent_tiles[@changeable_tiles[idx]] = @changeable_tiles[idx - 1] }
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