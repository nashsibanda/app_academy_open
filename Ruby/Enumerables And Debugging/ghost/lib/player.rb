class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def guess
    puts "#{@name}'s turn." 
    puts "Enter a valid letter: "
    return gets.chomp.downcase
  end

end