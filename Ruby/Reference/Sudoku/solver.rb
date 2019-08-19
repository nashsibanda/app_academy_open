class Solver
  
  def initialize(board)
    @board = board
    @current_tile = board.changeable_tiles[0]
  end

  def solve
    until @board.solved?
      system("clear")
      @board.render
      if @current_tile.number < 9
        @current_tile.number += 1
        if @board.unique?(@current_tile)
          @current_tile = @board.child_tiles[@current_tile]
        end
      else
        @current_tile.number = 0
        @current_tile = @board.parent_tiles[@current_tile]
      end
    end
    system("clear")
    @board.render
    puts "Solved!"
    return true
  end

  private

end