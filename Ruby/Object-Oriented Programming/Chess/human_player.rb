class HumanPlayer < Player

  def make_move(board)
    start_position, end_position = nil, nil
    until @display.cursor.selected == true
      @display.render
      puts "#{@color.to_s.capitalize} player's turn."
      @display.cursor.get_input
    end
    start_position = @display.cursor.cursor_pos
    puts "Start position: #{start_position}"
    until @display.cursor.selected == false
      @display.render
      puts "#{@color.to_s.capitalize} player's turn."
      @display.cursor.get_input
    end
    end_position = @display.cursor.cursor_pos
    puts "End position: #{end_position}"
    raise "Piece deselected." if start_position == end_position
  rescue
    retry
  else
    board.move_piece(@color, start_position, end_position)
  end

end