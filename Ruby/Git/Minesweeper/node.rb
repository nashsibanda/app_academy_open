class Node

  attr_reader :bomb, :flagged, :position, :neighbours
  attr_accessor :bomb, :flagged
  
  def initialize(position, width, height)
    @bomb = false
    @flagged = false
    @position = position
    @neighbours = calc_neighbours(width, height)
  end

  def to_s
    "I'm at #{@position} and my neighbours are #{@neighbours}"
  end

  def flag_toggle
    @flagged ? @flagged = false : @flagged = true
  end

  private

  def calc_neighbours(width, height)
    neighbours = [[@position[0], @position[1] - 1], [@position[0], @position[1] + 1], [@position[0] - 1, @position[1]], [@position[0] + 1, @position[1]]]
    neighbours.delete_if { |coords| !coords[0].between?(0, height) || !coords[1].between?(0, width) }
    neighbours
  end

end