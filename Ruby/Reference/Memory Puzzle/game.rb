require_relative "./board.rb"
require_relative "./player.rb"

class Game
  
  def initialize(pairs)
    @board = Board.new(pairs)
    @player = Player.new
    @first_guess
    @matched_card_positions = []
  end

  def play
    while !@board.game_over?
      system("clear")
      @board.display_board
      pos = @player.guess
      until @board[pos].facing == "down"
        puts "Please choose a face-down card"
        pos = @player.guess
      end
      self.make_guess(pos)
    end
  end

  def make_guess(pos)
    @board[pos].flip("up")
    if @first_guess == nil
      @first_guess = pos
      return
    end
    if @board[pos].face_value == @board[@first_guess].face_value
      @board[pos].match
      @board[@first_guess].match
      @board.display_board
      puts "Matched!"
      sleep(2)
      @first_guess = nil
      return
    end
    if @board[pos].face_value != @board[@first_guess].face_value
      @board.display_board
      puts "No match!"
      sleep(2)
      @board[pos].flip("down")
      @board[@first_guess].flip("down")
      @first_guess = nil
      return
    end
  end

end

temp = Game.new(8)
temp.play