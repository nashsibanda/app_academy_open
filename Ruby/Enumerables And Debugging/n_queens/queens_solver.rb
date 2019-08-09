require_relative "./board.rb"
require_relative "./node.rb"

class Solver

  def initialize(board)
    @board = board
    @columns = *(0...@board.n)
  end

  def unconflicted?(this_queen)
    conflicts = {}
    @board.queens.each do |queen_key, other_queen|
      if other_queen != this_queen && this_queen.conflicts.include?(other_queen.position)
        conflicts[queen_key] = true
      end
    end
    if conflicts.empty?
      # puts "No conflicts left for #{this_queen.name}!"
      return true
    else
      # puts "#{conflicts.length} conflicts left for #{this_queen.name}!"
      # sleep(0.3)
      return false
    end
  end

  def mover(column_number)
    # Pick the queen from the column number
    q_hash = @board.queens.select { |key, queen| queen.position[1] == column_number }
    this_queen = q_hash.values.first
    current_row = this_queen.position[0]
    # puts "Selected #{this_queen.name} at #{this_queen.position}"

    # Find the number of conflicts in the current position
    current_conflict_count = 0
    @board.queens.each do |queen_key, other_queen|
      if other_queen != this_queen
        current_conflict_count += 1 if this_queen.conflicts.include?(other_queen.position)
      end
    end

    # Find number of conflicts in other nodes
    new_node_conflicts = {}
    @board.node_map.flatten.each do |node|
      if node.position[1] == column_number && node.position[0] != current_row
        prospective_conflict_count = 0
        @board.queens.each do |queen_key, other_queen|
          if other_queen != this_queen
            prospective_conflict_count += 1 if node.conflicts.include?(other_queen.position)
          end
        end
        new_node_conflicts[node] = prospective_conflict_count
      end
    end

    # See if there are less conflicts in another node
    new_node_conflicts.delete_if { |node, conflicts| conflicts > current_conflict_count }
    # puts "No node conflicts!" if new_node_conflicts.empty?
    return true if new_node_conflicts.empty?
    # puts "#{new_node_conflicts.length} better nodes found for #{this_queen.name}"
    # new_node_conflicts.each { |node, conflicts| puts "#{node.position} is better" }
    less_conflicted_nodes = new_node_conflicts.keys

    # Move queen to less conflicted node position
    new_node = less_conflicted_nodes.sample
    this_queen.node = new_node
    # puts "#{this_queen.name} moved to #{new_node.position.to_s}"
    puts @board.print_board
    puts "*" * @board.n * 5
    return true
  end

  def solver
    while @board.queens.values.any? { |queen| !unconflicted?(queen) }
      mover(@columns.sample)
    end
    puts "SOLVED!"
    return true
  end

end

