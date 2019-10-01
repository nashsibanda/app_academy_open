class HumanPlayer < Player

  def make_move(_board)
    start_position, end_position = nil, nil
    @display.cursor.get_input until @display.cursor.selected == true
    start_position = @display.cursor.cursor_pos
    @display.cursor.get_input until @display.cursor.selected == false
    end_position = @display.cursor.cursor_pos
    raise "Piece deselected." if start_position == end_position
    @display.board.move_piece(@color, start_position, end_position)
  rescue
    retry
  end

end