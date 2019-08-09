class Writer

  attr_reader :filename, :maze_array, :path

  def initialize(filename, maze, path)
    @filename = filename
    @maze_array = maze.maze
    @path = path
    @path.pop
    @path.shift
  end

  def write
    @path.each do |coords|
      row = coords[0]
      spot = coords[1]
      @maze_array[row][spot] = "X"
    end
    @maze_array.map!(&:join)
    output_file = File.open("./maze/#{filename}.txt", "w")
    output_file.puts @maze_array
  end

end