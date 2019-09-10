require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node = TicTacToeNode.new(game.board, mark)
    possible_moves = node.children
    possible_moves.each do |child|
      return child.prev_move_pos if child.winning_node?(mark)
    end
    node = possible_moves.find do |child|
        !child.losing_node?(mark)
      end
    return node.prev_move_pos if node
    raise "No non-losing nodes found!"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
