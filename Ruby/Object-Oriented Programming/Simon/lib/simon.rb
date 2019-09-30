class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    system("clear")
    take_turn until @game_over
    if @game_over
      game_over_message
      reset_game
      play
    end
  end

  def take_turn
    show_sequence
    require_sequence
    if !@game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      sleep(0.5)
      puts color
      sleep(0.5)
      system("clear")
    end
  end

  def require_sequence
    input = []
    until input.length == @sequence_length
      input << gets.chomp
      puts "Input array: #{input}"
      puts "Seq array: #{@seq}"
      sleep(3)
      system("clear")
    end
    return true if input == @seq
    @game_over = true
    false
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Nice work, you're able to play an elementary game for children. You must be so proud. Let's keep going."
    sleep(0.8)
    system("clear")
  end

  def game_over_message
    puts "Bad luck! Try harder next time, you absolute failure."
    sleep(5)
  end

  def reset_game
    initialize
  end
end

game = Simon.new
game.play