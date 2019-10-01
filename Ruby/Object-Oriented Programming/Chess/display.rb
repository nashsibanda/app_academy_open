require_relative "cursor"
require_relative "board"
# require_relative "colors"

class Display
  
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render
    render_board = @board.clone
    render_board.rows.each_with_index do |row, r_idx|
      row.each_with_index do |piece, p_idx|
        pos = [r_idx, p_idx]
        if pos == @cursor.cursor_pos
          if render_board[pos].class == NullPiece && @cursor.selected
            render_board[pos] = "☐".colorize(cursor_color(:selected))
          elsif render_board[pos].class == NullPiece
            render_board[pos] = "☐".colorize(cursor_color(:hovered))
          elsif @cursor.selected
            piece.color = cursor_color(:selected)
          else
            piece.color = cursor_color(:hovered)
          end
        else
          piece.color = cursor_color(piece.color)
        end
      end
      puts row.join(" ")
    end
    # @board.rows.each { |row| puts row.join(" ") }
  end

  def render_loop
    i = 0
    while true
      system("clear")
      render
      check_checker
      puts "Iteration: #{i}"
      sleep(1)
      check_maker(i)
      # @cursor.get_input
      i += 1
    end
  end

  private

  def cursor_color(state = @color)
    case state
    when :hovered
      :green
    when :selected
      :red
    when :white
      :yellow
    when :black
      :blue
    when :null
      :gray
    end
  end

  def check_checker
    puts "White in check: #{@board.in_check?(:white)}"
    puts "White in checkmate: #{@board.checkmate?(:white)}"
    puts "Black in check: #{@board.in_check?(:black)}"
    puts "Black in checkmate: #{@board.checkmate?(:black)}"
    pos = [6, 5]
    puts "Orig. pawn spot: #{@board[pos].class}"
  end

  def check_maker(iteration)
    case iteration
    when 0
      return
    when 1
      s = [6,5]
      e = [5,5]
      color = :white
      @board.move_piece(color, s, e)
    when 2
      s = [1, 4]
      e = [3, 4]
      color = :black
      @board.move_piece(color, s, e)
    when 3
      s = [6, 6]
      e = [4, 6]
      color = :white
      @board.move_piece(color, s, e)
    when 4
      s = [0,3]
      e = [4, 7]
      color = :black
      @board.move_piece(color, s, e)
    else
      return
    end
  end

end