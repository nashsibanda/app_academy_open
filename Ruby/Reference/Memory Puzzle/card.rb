class Card
  attr_reader :face_value, :facing

  def initialize(face_value, position)
    @face_value = face_value
    @facing = "down"
    @position = position
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

end