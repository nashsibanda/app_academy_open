class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(array)
    return false if !array.all? { |peg| POSSIBLE_PEGS.has_key?(peg.upcase) }
    true
  end

  def initialize(peg_array)
    raise "invalid pegs, please choose different ones, you muppet" if !Code.valid_pegs?(peg_array)
    @pegs = peg_array.map(&:upcase)
  end

  def self.random(length)
    peg_array = []
    while peg_array.length < length
      peg_array << POSSIBLE_PEGS.keys[rand(POSSIBLE_PEGS.length)]
    end
    return Code.new(peg_array)
  end

  def self.from_string(string)
    Code.new(string.split(""))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    exact_matches = 0
    guess.pegs.each_with_index do |guess_peg, idx|
      exact_matches += 1 if @pegs[idx] == guess_peg
    end
    return exact_matches
  end

  def num_near_matches(guess)
    near_matches = 0
    guess.pegs.each_with_index do |guess_peg, idx|
      near_matches += 1 if pegs[idx] != guess_peg && pegs.include?(guess_peg)
    end
    return near_matches
  end

  def ==(guess)
    guess.pegs == @pegs
  end

end
