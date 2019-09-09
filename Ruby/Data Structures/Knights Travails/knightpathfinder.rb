require_relative "polytreenode"
require "byebug"

class KnightPathFinder
  DELTAS = [[-1, -2], [-1, 2], [1, -2], [1, 2], [-2, -1], [-2, 1], [2, -1], [2, 1]]
  
  attr_reader :nodes, :start_position, :considered_positions
  
  def initialize(start_position)
    @root_node = PolyTreeNode.new(start_position)
    build_move_tree
  end

  def build_move_tree
  
  end

  def find_path(target)
    
  end

  def self.valid_moves(position)
    nearby_positions = DELTAS.map { |delta| delta = [(position[0] + delta[0]), (position[1] + delta[1])] }
    nearby_positions.delete_if { |nearby_position| nearby_position.any? { |ele| ele < 0 || ele > 7 } }
    nearby_positions
  end

  def new_move_positions(node)
    # node = select_node(position)
    new_moves = self.class.valid_moves(node).reject { |child| @considered_positions.include?(child) }
    @considered_positions += new_moves
    new_moves
  end

  # def select_node(position)
  #   return @nodes.select { |node| node.position == position }.first
  # end

  private



end

temp = KnightPathFinder.new([0, 0])
# p temp.nodes
puts
p temp.class.valid_moves([3, 3])
# p temp.new_move_positions(temp.select_node([1, 2]))
puts
temp.build_move_tree
p temp.considered_positions