class TowersGame
  attr_reader :tower1, :tower2, :tower3

  def initialize(size)
    @tower1, @tower2, @tower3, @goal_tower = [], [], [], []
    fill_tower1(size)
  end

  def move_disc(origin, destination)
    if !tower(destination).empty? && tower(destination).first < tower(origin).first
      raise "Can't place a disc above a smaller disc"
    end
    tower(destination).unshift(tower(origin).shift)
  end
  
  def won?
    return true if @tower3 == @goal_tower
    false
  end

  def play
    until won?
      p @tower1
      p @tower2
      p @tower3
      user_move
    end
    puts "You win!"
  end

  def user_move
    origin, destination = 0, 0
    until origin < 4 && origin > 0
      puts "origin please"
      origin = gets.chomp.to_i
    end
    until destination < 4 && destination > 0
      puts "destination please"
      destination = gets.chomp.to_i
    end
    move_disc(origin, destination)
  end

  private

  def fill_tower1(size)
    size.times do |time|
      @tower1 << (1 + time)
      @goal_tower << (1 + time)
    end
  end

  def tower(num)
    case num
    when 1
      @tower1
    when 2
      @tower2
    when 3
      @tower3
    end
  end
  
end