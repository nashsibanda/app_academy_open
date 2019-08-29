require_relative "node"

class Board

  attr_reader :board, :positions, :bomb_positions

  def initialize(bombs, width, height = width)
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
    rendered_board = make_board(@width, @height)
    @board.each_with_index do |row, row_idx|
      row.each_with_index do |spot, spot_idx|
        if !spot.revealed
          rendered_board[row_idx][spot_idx] = " * "
        end
        if spot.bomb
          rendered_board[row_idx][spot_idx] = " B "
        end
      end
    end
    puts rendered_board.map(&:join)
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
      end
    end
  end

end

temp = Board.new(5, 9)
p temp.bomb_positions
temp.render