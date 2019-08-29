require_relative "node"

class Board

  attr_reader :board, :positions

  def initialize(bombs, width, height = width)
    @board = make_board(width, height)
    @width, @height = width, height
    @positions = []
    @bombs = bombs
    populate_nodes
    add_bombs(@bombs)
  end
  
  def [](row, col)
    @board[row][col]
  end

  def []=(row, col, value)
    @board[row][col][value]
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
        @board[row_idx][spot_idx] = Node.new(position, @width, @height)
      end
    end
  end

  def add_bombs(bombs)
    bomb_positions = @positions.sample(bombs)
    p bomb_positions
    bomb_positions.each do |position|
      @board[position[0]][position[1]].bomb = true
    end
  end

end

temp = Board.new(5, 3, 5)
p temp.board
