require_relative "cursor"
require_relative "board"

class Display
  
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    render_board = @board.clone
    render_board.rows.each_with_index do |row, r_idx|
      row.each_with_index do |piece, p_idx|
        pos = [r_idx, p_idx]
        if pos == @cursor.cursor_pos
          if render_board[pos].class == NullPiece
            render_board[pos] = "☐".colorize(:green)
          else
            piece.color = :hovered
          end
        end
      end
      puts row.join(" ")
    end
    # @board.rows.each { |row| puts row.join(" ") }
  end

  def render_loop
    while true
      system("clear")
      render
      @cursor.get_input
    end
  end

  private

  def cursor_color
    
  end

end

tempboard = Board.new
tempdisplay = Display.new(tempboard)
tempdisplay.render_loop