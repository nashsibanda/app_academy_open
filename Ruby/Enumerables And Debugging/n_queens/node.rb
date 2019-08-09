class Node
  attr_reader :position, :conflicts

  def initialize(position, n)
    @position = position
    @conflicts = []
    @n = n
    self.calc_conflicts
  end

  def calc_conflicts
    @n.times { |i| @conflicts << [@position[0], i] }
    @n.times { |i| @conflicts << [i, @position[1]] }
    @n.times { |i| @conflicts.push([(@position[0]-i-1), (@position[1]-i-1)], [(@position[0]+i+1), (@position[1]-i-1)], [(@position[0]-i-1), (@position[1]+i+1)], [(@position[0]+i+1), (@position[1]+i+1)]) }
    @conflicts.delete_if { |coords| coords[0] < 0 || coords[1] < 0 || coords[0] >= @n || coords[1] >= @n || coords == @position }
  end

  def conflict_map
    map = Array.new(@n) {Array.new(@n, "O")}
    @conflicts.each do |coords|
      map[coords[0]][coords[1]] = "X"
    end
    map
  end

end