require_relative "polytreenode"
require "byebug"

class KnightPathFinder
  DELTAS = [[-1, -2], [-1, 2], [1, -2], [1, 2], [-2, -1], [-2, 1], [2, -1], [2, 1]]
  
  attr_reader :nodes, :start_position, :considered_positions
  
  def initialize(start_position)
    @valid_positions = valid_positions
    @nodes = populate_nodes
    @start_position = select_node(start_position)
    @considered_positions = [@start_position]
    give_children_to_nodes
  end

  def build_move_tree
    # debugger
    queue = [@start_position]
    until queue.empty?
      node = queue.shift
      queue += new_move_positions(node)
    end
  end

  def self.valid_moves(node)
    return node.children
  end

  def new_move_positions(node)
    # node = select_node(position)
    new_moves = self.class.valid_moves(node).reject { |child| @considered_positions.include?(child) }
    @considered_positions += new_moves
    new_moves
  end

  def select_node(position)
    return @nodes.select { |node| node.position == position }.first
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
    # debugger
    @nodes.each do |node|
      root_position = node.position
      nearby_positions = DELTAS.map { |delta| delta = [(root_position[0] + delta[0]), (root_position[1] + delta[1])] }
      child_nodes = @nodes.select { |node| nearby_positions.include?(node.position) }
      # child_nodes.each { |child| node.children << child }
      node.children = child_nodes
      # p node
    end
  end

end

temp = KnightPathFinder.new([0, 0])
# p temp.nodes
puts
p temp.start_position
p temp.new_move_positions(temp.select_node([1, 2]))
puts
temp.build_move_tree
p temp.considered_positions