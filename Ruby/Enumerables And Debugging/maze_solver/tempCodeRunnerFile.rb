set_file = File.open("mazearray.rb", "w")
  set_file.write "maze_arr = "
  set_file.write File.readlines("maze1.txt", chomp: true)