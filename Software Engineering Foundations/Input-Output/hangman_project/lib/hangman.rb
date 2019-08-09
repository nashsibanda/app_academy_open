class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end
  
  def already_attempted?(char)
    return true if @attempted_chars.include?(char)
    false
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index do |letter, idx|
      indices << idx if letter == char
    end
    indices
  end

  def fill_indices(char, idx_arr)
    idx_arr.each { |index| @guess_word[index] = char }
  end

  def try_guess(char)
    if already_attempted?(char)
      p "that has already been attempted"
      false
    else
      @attempted_chars << char
      if get_matching_indices(char).length == 0
        @remaining_incorrect_guesses -= 1
        true
      else
        fill_indices(char, get_matching_indices(char))
        true
      end
    end
  end

  def ask_user_for_guess
    p "Enter a char:"
    guess = gets.chomp
    try_guess(guess)    
  end

  def win?
    if @guess_word.join("") == @secret_word
      p "WIN"
      true
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      true
    else
      false
    end
  end

  def game_over?
    if self.lose? || self.win?
      p @secret_word
      true
    else
      false
    end
  end

end
