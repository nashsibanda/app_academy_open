class Node

  attr_reader :position, :h_score

  def initialize(position, h_score)
    @position = position
    @h_score = h_score
    @nearby_nodes = []
    @nearby_nodes.push(([position[0]-1), position[1]]).push(([position[0]), (position[1]+1)]).push(([position[0]+1), position[1]]).push(([position[0]), (position[1]-1)])
  end

end

node = Node.new([3, 4], 12)