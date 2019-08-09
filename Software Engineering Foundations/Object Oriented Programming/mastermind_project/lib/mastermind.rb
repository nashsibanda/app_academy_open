require_relative "code"

class Mastermind
  
  def initialize(length)
    @secret_code = Code.random(length)
  end

  def print_matches(code_inst)
    puts "Exact matches: " + @secret_code.num_exact_matches(code_inst).to_s
    puts "Near matches: " + @secret_code.num_near_matches(code_inst).to_s
  end

  def ask_user_for_guess
    puts "Enter a code:"
    guess = Code.from_string(gets.chomp)
    print_matches(guess)
    return guess.pegs == @secret_code.pegs
  end

end
