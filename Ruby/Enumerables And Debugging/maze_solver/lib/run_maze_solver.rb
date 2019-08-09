require "./lib/maze.rb"
require "./lib/maze_solver_2.rb"
require "./lib/node.rb"
require "./lib/solution_writer.rb"

### ENTER FILENAME OF MAZE HERE (WITHOUT .TXT SUFFIX)
maze_name = ARGV[0]
###########

maze_solution = "#{maze_name}_solution"

game_maze = Maze.new(maze_name)
start = game_maze.start
goal = game_maze.goal
solver = Solver.new(game_maze, start, goal)
path = solver.path_coords
marray = Writer.new(maze_solution, game_maze, path)
marray.write
puts marray.maze_array
# solver.resolving

# p bleh
# p solver.closed_list.map { |node| node.position }

# p solver
# game_maze.printmap

# p solver.test([2, 4])
# p solver.vert_dir(solver.start)
# p solver.start
# solver.pathfinder

# print solver.maze