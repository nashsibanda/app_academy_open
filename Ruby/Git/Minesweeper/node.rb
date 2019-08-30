class Node

  attr_reader :bomb, :flagged, :position, :neighbours, :revealed, :display
  attr_accessor :bomb, :flagged, :bombed_neighbours
  
  def initialize(position, width, height)
    @bomb = false
    @flagged = false
    @position = position
    @neighbours = calc_neighbours(width, height)
    @bombed_neighbours = []
    @revealed = false
    @display
  end

  def to_s
    "I'm at #{@position} and my neighbours are #{@neighbours}"
  end

  def inspect
    { "Node #{@position}'s bombed neighbours'" => @bombed_neighbours, "bomb" => @bomb, "revealed?" => @revealed }.inspect
  end

  def flag_toggle
    @flagged ? @flagged = false : @flagged = true
  end

  def reveal
    @revealed = true if @flagged == false
  end

  def display_value
    if flagged
      return " F "
    elsif !revealed
      return " * "
    elsif @bomb
      return " B "
    elsif @bombed_neighbours.length == 0
      return " - "
    else
      return " #{@bombed_neighbours.length} "
    end
  end

  def action(action)
    case action
    when "r"
      reveal
    when "f"
      flag_toggle
    end
  end

  private

  def calc_neighbours(width, height)
    neighbours = [
      [@position[0], @position[1] - 1], 
      [@position[0], @position[1] + 1], 
      [@position[0] - 1, @position[1]], 
      [@position[0] + 1, @position[1]],
      [@position[0] - 1, @position[1] - 1], 
      [@position[0] + 1, @position[1] - 1], 
      [@position[0] - 1, @position[1] + 1], 
      [@position[0] + 1, @position[1] + 1]
    ]
    neighbours.delete_if { |coords| !coords[0].between?(0, height) || !coords[1].between?(0, width) }
    neighbours
  end


end