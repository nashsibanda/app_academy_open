class Maze
  attr_reader :position, :empty_spaces, :start, :node_map, :size, :goal
  attr_accessor :maze

  def initialize(filename)
    @filename = "./maze/#{filename}.txt"
    @maze = File.readlines(@filename, chomp: true).map { |x| x.split("") }
    puts "#{@filename} loaded!"
    @size = [@maze.length, @maze[0].length]
    @position = []
    @goal = []
    @maze.each_with_index do |row, row_idx|
      row.each_with_index do |spot, spot_idx|
        if spot == "S"
          @position = [row_idx, spot_idx]
          @start = [row_idx, spot_idx]
        elsif spot == "E"
          @goal = [row_idx, spot_idx]
        end
      end
    end
    @empty_spaces = []
    @maze.each_with_index do |row, row_idx|
      row.each_with_index do |spot, spot_idx|
        case spot
        when " ", "E", "S"
          @empty_spaces << [row_idx, spot_idx]
        end
      end
    end
    @h_scores = Array.new(@maze.length) {Array.new}
    @maze.each_with_index do |row, row_idx|
      row.each_with_index do |spot, spot_idx|
        @h_scores[row_idx] << ((row_idx-@goal[0]).abs + (spot_idx-@goal[1]).abs)
      end
    end
    @node_map = Array.new(@maze.length) {Array.new}
    @maze.each_with_index do |row, row_idx|
      row.each_with_index do |spot, spot_idx|
        new_node = Node.new([row_idx, spot_idx], @h_scores[row_idx][spot_idx], @size, spot)
        @node_map[row_idx] << new_node
      end
    end
    # puts @h_scores.map(&:join)
  end

  def [](row, col)
    @node_map[row][col]
  end

  def printmap
    puts @node_map.map { |noderow| noderow.map { |node| node.content }.join }
  end

  def test(position)
    self[position]
  end

  def self.empty?(position)
    self.empty_spaces.include?(position)
  end

end