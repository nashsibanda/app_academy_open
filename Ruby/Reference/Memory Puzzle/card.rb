class Card
  attr_reader :face_value

  def initialize(face_value, position)
    @face_value = face_value
    @facing = "down"
    @position = position
  end


end