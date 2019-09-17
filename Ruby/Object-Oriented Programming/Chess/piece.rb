class Piece

  def initialize(color)
    @color = color
  end

  def inspect
    "#{@color.to_s.capitalize} Piece"
  end

  def valid_move?
    return true    
  end
  
end