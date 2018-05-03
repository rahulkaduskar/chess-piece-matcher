# Piece having coordinates
class Piece
  attr_accessor :x, :y

  def coordinates=(args)
    self.x, self.y = *args
  end

  def coordinates
    [x, y]
  end
end
