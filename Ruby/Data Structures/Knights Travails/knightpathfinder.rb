require_relative "polytreenode"
require "byebug"

class KnightPathFinder
  DELTAS = [[-1, -2], [-1, 2], [1, -2], [1, 2], [-2, -1], [-2, 1], [2, -1], [2, 1]]
  
  attr_reader :nodes, :start_position, :considered_positions
  
  def initialize(start_position)
    @root_node = PolyTreeNode.new(start_position)
    @considered_positions = [start_position]
    build_move_tree
  end

  def find_path(target)
    
  end
  
  private

  def build_move_tree
    nodes = [@root_node]
    until nodes.empty?
      node = nodes.shift
      next_moves = new_move_positions(node.position)
      next_moves.each do |position|
        new_node = PolyTreeNode.new(position)
        node.add_child(new_node)
        nodes << new_node
      end
    end
  end

  def self.valid_moves(position)
    nearby_positions = DELTAS.map { |delta| delta = [(position[0] + delta[0]), (position[1] + delta[1])] }
    nearby_positions.delete_if { |nearby_position| nearby_position.any? { |ele| ele < 0 || ele > 7 } }
    nearby_positions
  end

  def new_move_positions(position)
    new_moves = self.class.valid_moves(position).reject { |position| @considered_positions.include?(position) }
    @considered_positions += new_moves
    new_moves
  end

end

temp = KnightPathFinder.new([0, 0])
# temp.build_move_tree
p temp.considered_positions