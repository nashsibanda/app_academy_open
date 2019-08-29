require_relative "node"

class Board

  attr_reader :board, :positions

  def initialize(width, height = width)
    @board = make_board(width, height)
    @width, @height = width, height
    @positions = []
    populate_nodes
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

end

temp = Board.new(3, 5)
p temp.board
