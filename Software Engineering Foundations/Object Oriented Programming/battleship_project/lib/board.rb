class Board
  attr_reader :size

  def initialize(n)
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = n * n
    @width = n
  end

  def [](position)
    @grid[position[0]][position[1]]
  end

  def []=(position, value)
    @grid[position[0]][position[1]] = value
  end

  def num_ships
    @grid.flatten.count(:S)
  end

  def attack(position)
    if self[position] == :S
      self[position] = :H
      puts "You sunk my battleship!"
      return true
    else
      self[position] = :X
      return false
    end
  end

  def place_random_ships
    while @grid.flatten.count(:S) < (@size / 4)
      @grid[rand(@width)][rand(@width)] = :S
    end
  end

  def hidden_ships_grid
    hidden_grid = []
    @grid.each do |row|
      hidden_row = []
      row.each { |spot| hidden_row << spot }
      hidden_grid << hidden_row
    end
    hidden_grid.each_index do |row_idx|
      hidden_grid[row_idx].each_index do |spot_idx|
        if hidden_grid[row_idx][spot_idx] == :S
          hidden_grid[row_idx][spot_idx] = :N
        end
      end
    end
    return hidden_grid
  end

  def self.print_grid(grid)
    grid.each { |row| puts row.join(" ") }
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
end
