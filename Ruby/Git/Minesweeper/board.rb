require_relative "node"
require "colorize"

class Board

  attr_reader :board, :positions, :bomb_positions

  def initialize(bombs, width, height)
    @board = make_board(width, height)
    @width, @height = width, height
    @positions, @nodes = [], []
    @bombs = bombs
    @bomb_positions
    populate_nodes
    add_bombs(@bombs)
    check_neighbours_for_bombs
  end
  
  def [](row, col)
    @board[row][col]
  end

  def []=(row, col, value)
    @board[row][col][value]
  end

  def render
    display_board = @board.map { |row| row.map { |node| node.display_value } }
    puts grid_helper(display_board).map(&:join)
  end

  def solved?
    @board.all? { |row| row.all? { |node| !node.bomb && node.revealed } }
  end

  private

  def make_board(width, height)
    board = Array.new (height) { Array.new(width, []) }
  end

  def populate_nodes
    @board.each_with_index do |row, row_idx|
      row.each_with_index do |spot, spot_idx|
        position = [row_idx, spot_idx]
        @positions << position
        new_node = Node.new(position, @width, @height)
        @nodes << new_node
        @board[row_idx][spot_idx] = new_node
      end
    end
  end

  def add_bombs(bombs)
    bomb_positions = @positions.sample(bombs)
    @bomb_positions = bomb_positions
    bomb_positions.each do |position|
      @board[position[0]][position[1]].bomb = true
    end
  end

  def check_neighbours_for_bombs
    @bomb_positions.each do |position|
      @nodes.each do |node|
        if node.neighbours.include?(position)
          node.bombed_neighbours << position
        end
        node.display_value
      end
    end
  end

  def grid_helper(display_board)
    board_rows = display_board.length
    board_cols = display_board[0].length
    top_row = [" "]
    (0...board_cols).each do |num|
      top_row << " #{num.to_s.colorize(:red)} " if num < 10
      top_row << " #{num.to_s.colorize(:red)}" if num >= 10
    end
    display_board.unshift(top_row)
    (1..board_rows).each do |num|
      display_board[num].unshift("#{(num - 1).to_s.colorize(:red)} ") if num < 11
      display_board[num].unshift("#{(num - 1).to_s.colorize(:red)}") if num >= 11
    end
    return display_board
  end

end

temp = Board.new(25, 20, 20)
p temp.bomb_positions
temp.render