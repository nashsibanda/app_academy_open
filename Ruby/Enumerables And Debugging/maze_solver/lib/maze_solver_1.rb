require "byebug"

class Solver
  attr_reader :maze, :position, :empty_spaces, :start, :horiz_dir, :horiz_opp, :vert_opp, :vert_dir, :solved
  attr_accessor :new_position
  
  def initialize(maze)
    @maze = maze.maze_arr
    @position = []
    @goal = []
    @maze.each_with_index do |row, row_idx|
      row.each_with_index do |spot, spot_idx|
        if spot == "S"
          @position = [row_idx, spot_idx]
          @start = [row_idx, spot_idx]
        elsif spot == "E"
          @goal = [row_idx, spot_idx]
        end
      end
    end
    @empty_spaces = []
    @maze.each_with_index do |row, row_idx|
      row.each_with_index do |spot, spot_idx|
        case spot
        when " ", "E", "S"
          @empty_spaces << [row_idx, spot_idx]
        end
      end
    end
    @new_position = []
    @tried_positions = []
    @vert_dir, @horiz_dir = self.vert_dir(@start), self.horiz_dir(@start)
    @vert_opp, @horiz_opp = dir_opp(@vert_dir), dir_opp(@horiz_dir)
    @current_direction = @vert_dir
    # @previous_direction = ""
    @moves = 0
    @solved
    # p @position
    # p @empty_spaces
    p @goal
  end

  def [](position)
    @maze[position[0]][position[1]]
  end

  def []=(position, value)
    @maze[position[0]][position[1]] = value
  end

  def test(position)
    self[position]
  end

  def empty?(position)
    self.empty_spaces.include?(position)
  end

  def vert_dir(position)
    if position[0] > @goal[0]
      return "up"
    else
      return "down"
    end
  end

  def horiz_dir(position)
    if position[1] < @goal[1]
      return "right"
    else
      return "left"
    end
  end

  def dir_opp(dir)
    case dir
    when "up"
      return "down"
    when "down"
      return "up"
    when "left"
      return "right"
    when "right"
      return "left"
    end
  end

  def recalibrate
    @vert_dir, @horiz_dir = self.vert_dir(@position), self.horiz_dir(@position)
    @vert_opp, @horiz_opp = dir_opp(@vert_dir), dir_opp(@horiz_dir)
  end

  def move(dir)
    case dir
    when "up"
      p "looked up to #{@new_position}"
      return [@position[0]-1, @position[1]]
    when "down"
      return [@position[0]+1, @position[1]]
    when "left"
      return [@position[0], @position[1]-1]
    when "right"
      return [@position[0], @position[1]+1]
    end
  end

  def change_direction(current_direction)
    if current_direction == @vert_dir && self.empty?(move(@horiz_dir))
      return @horiz_dir
    elsif current_direction == @horiz_dir && self.empty?(move(@vert_dir))
      return @vert_dir
    elsif current_direction == @vert_dir && self.empty?(move(@horiz_opp))
      return @horiz_opp
    elsif current_direction == @horiz_dir && self.empty?(move(@vert_opp))
      return @vert_opp
    elsif current_direction == @vert_opp && self.empty?(move(@horiz_dir))
      return @horiz_dir
    elsif current_direction == @horiz_opp && self.empty?(move(@vert_dir))
      return @vert_dir
    elsif current_direction == @vert_opp && self.empty?(move(@horiz_opp))
      return @horiz_opp
    elsif current_direction == @horiz_opp && self.empty?(move(@vert_opp))
      return @vert_opp
    else
      return "ummm"
    end
  end

  def pathfinder
    # debugger
    # sleep(0.5)
    p "current direction is #{@current_direction}"
    @new_position = move(@current_direction)
    while self.empty?(@new_position)
      sleep(0.5)
      @position = @new_position
      p "we are now at #{@position}"
      self[@position] = "X"
      @empty_spaces.delete(@position)
      @moves += 1
      puts self.maze.map(&:join)
      @new_position = move(@current_direction)
    end
    if self[@position] == self[@goal]
      self[@position] = "E"
      p "Finished!"
      @solved = self.maze.map(&:join)
      puts @solved
      return true
    end
    self.recalibrate
    @current_direction = change_direction(@current_direction)
    p "we changed direction at #{@position}"
    p "current direction is #{@current_direction}"
    puts self.maze.map(&:join)
    self.pathfinder
  end

end


  


# def nearby?(try_position)
#     if try_position[0] == (@position[0]+1) || try_position[0] == (@position[0]-1)
#       return true if try_position[1] == @position[1]
#     elsif try_position[1] == (@position[1]+1) || try_position[1] == (@position[1]-1)
#       return true if try_position[0] == @position[0]
#     else
#       return false
#     end
#     return false
#   end

#   def mover
#     @new_position = @empty_spaces[rand(@empty_spaces.length)]
#     while !self.nearby?(@new_position) || @tried_positions.include?(@new_position)
#       @new_position = @empty_spaces[rand(@empty_spaces.length)]
#     end
#     @position = @new_position
#     @tried_positions << @new_position
#     @moves += 1
#   end

#   def bigmover
#     self.mover
#     until @position == @goal
#       self.mover
#     end
#     p "done in #{@moves} moves"

#   end