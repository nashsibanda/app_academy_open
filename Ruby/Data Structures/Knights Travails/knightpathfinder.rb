require_relative "polytreenode"

class KnightPathFinder
  attr_reader :nodes
  
  def initialize(start_position)
    @start_position = start_position
    @valid_positions = valid_positions
    @nodes = populate_nodes
    give_children_to_nodes
  end

  private

  def populate_nodes
    nodes = []
    @valid_positions.each do |position|
      nodes << PolyTreeNode.new(position)
    end
    nodes
  end

  def valid_positions
    valid_positions = []
    (0..7).to_a.each do |row|
      (0..7).to_a.each do |col|
        valid_positions << [row, col]
      end
    end
    valid_positions
  end

  def give_children_to_nodes
    
  end

end

temp = KnightPathFinder.new([0, 0])
p temp.nodes