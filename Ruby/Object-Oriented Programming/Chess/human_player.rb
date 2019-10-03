class HumanPlayer < Player

  def make_move(board)
    start_position, end_position = nil, nil
    turn_loop until @display.cursor.selected == true
    start_position = @display.cursor.cursor_pos
    puts "Start position: #{start_position}"
    turn_loop until @display.cursor.selected == false
    end_position = @display.cursor.cursor_pos
    puts "End position: #{end_position}"
    raise "Piece deselected." if start_position == end_position
  rescue
    retry
  else
    board.move_piece(@color, start_position, end_position)
  end

  private

  def turn_loop
    @display.render
    puts "#{@color.to_s.capitalize} player's turn."
    @display.cursor.get_input
  end

end