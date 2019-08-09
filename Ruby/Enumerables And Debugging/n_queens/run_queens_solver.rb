=begin
  A min-conflicts algorithmic solution to n-Queens. Coded as part of the App Academy Open course.
=end

require_relative "./board.rb"
require_relative "./queens_solver.rb"

puts "Welcome to n-Queens! How big is your intended chessboard?"
size = gets.to_i

board = Board.new(size)
# puts board.print_board
board_solver = Solver.new(board)
board_solver.solver
# board_solver.mover(0)