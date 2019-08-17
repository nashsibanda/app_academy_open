class Card
  attr_reader :face_value, :facing, :matched

  def initialize(face_value, position)
    @face_value = face_value
    @facing = "down"
    @position = position
    @matched = false
  end

  def to_s
    "Card: #{@face_value} "
  end

  def flip(facing)
    case facing
    when "up"
      @facing = "up"
    when "down"
      @facing = "down"
    end
  end

  def match
    @matched = true
    @facing = "up"
  end

end