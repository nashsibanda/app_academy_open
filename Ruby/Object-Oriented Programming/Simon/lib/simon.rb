class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until @game_over
    if @game_over
      game_over_message
      reset_game
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
      puts color
      sleep (0.5)
      system("clear")
    end
  end

  def require_sequence
    input = []
    until input.length == @sequence_length
      input << gets.chomp
      system("clear")
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Nice work, let's keep going."
  end

  def game_over_message

  end

  def reset_game
    initialize
  end
end
