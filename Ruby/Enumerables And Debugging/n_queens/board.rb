require_relative "./node.rb"
require_relative "./queens.rb"

class Board
  attr_reader :board, :node_map, :n
  attr_accessor :queens

  def initialize(n)
    @board = Array.new(n) {Array.new(n, [])}
    @node_map = Array.new(n) {Array.new(n, [])}
    @queens = {}
    @n = n
    self.populate_board_and_nodes
    self.place_queens
  end

  def [](row, col)
    @node_map[row][col]
  end

  def populate_board_and_nodes
    @board.each_with_index do |row, row_idx|
      row.each_with_index do |spot, spot_idx|
        @board[row_idx][spot_idx] = [row_idx, spot_idx]
        @node_map[row_idx][spot_idx] = Node.new([row_idx, spot_idx], @n)
      end
    end
  end

  def place_queens
    columns = (0...@n).select { |i| i.even? }
    columns.push((0...@n).select { |i| i.odd? }).flatten!
    columns.each_with_index do |col, i|
      q_position = [i, col]
      n = @n
      q_name = "queen_#{i}"
      @queens[q_name] = Queen.new(q_name, self[i, col], n)
    end
  end

  def print_board
    queen_positions = @queens.values.map { |queen| queen.position }
    @board.each_with_index do |row, row_idx|
      row.each_with_index do |spot, spot_idx|
        if (row_idx.even? && spot_idx.even?) || (row_idx.odd? && spot_idx.odd?)
          @board[row_idx][spot_idx] = "  W  "
        else
          @board[row_idx][spot_idx] = "  B  "
        end
        if queen_positions.any?([row_idx, spot_idx])
          @board[row_idx][spot_idx] = " *Q* "
          next
        end
      end
    end
    return @board.map(&:join)
    # return queen_positions
  end

end

# temp = Board.new(8)
# temp.place_queens
# puts
# puts
# puts "QUEENS"
# p temp.queens
# puts
# puts "NODE MAP"
# p temp.node_map
# puts
# puts "Queen_0 conflicts"
# p temp.queens["queen_0"].node.conflicts