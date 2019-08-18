require_relative "./board.rb"
require_relative "./player.rb"

class Game
  
  def initialize(pairs, player_type)
    @board = Board.new(pairs)
    @player = PlayerFacade.new(player_type, @board)
    @first_guess
    @matched_card_positions = []
  end

  def play
    while !@board.game_over?
      system("clear")
      @board.display_board
      pos = @player.guess(@first_guess, @matched_card_positions)
      if !valid_pos?(pos)
        puts "Please choose a valid card position"
        pos = @player.guess(@first_guess, @matched_card_positions)
      end
      until @board[pos].facing == "down"
        puts "Please choose a face-down card"
        pos = @player.guess(@first_guess, @matched_card_positions)
      end
      self.make_guess(pos)
    end
    puts "Game over! You win!"
  end

  def make_guess(pos)
    @board[pos].flip("up")
    @player.remember_card(pos, @board[pos])
    puts @player.seen_cards
    sleep(0.5)
    if @first_guess == nil
      @first_guess = @board[pos]
      return
    end
    if @board[pos].face_value == @first_guess.face_value
      @board[pos].match
      @first_guess.match
      @matched_card_positions.push(pos, @first_guess.position)
      system("clear")
      @board.display_board
      puts "Matched!"
      sleep(1)
      @first_guess = nil
      return
    end
    if @board[pos].face_value != @first_guess.face_value
      system("clear")
      @board.display_board
      puts "No match!"
      sleep(1)
      @board[pos].flip("down")
      @first_guess.flip("down")
      @first_guess = nil
      return
    end
  end

  def valid_pos?(pos)
    if @board.board.length < pos[0]
      return false
    elsif @board.board[0].length < pos[1]
      return false
    end
    true
  end

end

temp = Game.new(8, "a")
temp.play