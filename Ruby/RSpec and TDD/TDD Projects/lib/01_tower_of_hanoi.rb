class TowersGame
  attr_reader :tower1, :tower2, :tower3

  def initialize(size)
    @tower1, @tower2, @tower3 = [], [], []
    fill_tower1(size)
  end

  def move_disc(origin, destination)
    if !tower(destination).empty? && tower(destination).first < tower(origin).first
      raise "Can't place a disc above a smaller disc"
    end
    tower(destination).unshift(tower(origin).shift)
  end

  private

  def fill_tower1(size)
    size.times { |time| @tower1 << (1 + time) }
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