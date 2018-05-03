# Piece matcher base class
class Matcher
  def initialize(pieces)
    @pieces = pieces
    raise ArgumentError, 'Two queens and two queens only!' if @pieces.count != 2
  end

  def attacking?
    attacking_diagonal? || attacking_vertical? || attacking_horizontal?
  end

  # Check for diagonal attacking coordinates
  # by default it wil be false as it is generic piece matcher
  def attacking_diagonal?
    false
  end

  # Check for vertical attacking coordinates
  # by default it wil be false as it is generic piece matcher
  def attacking_vertical?
    false
  end

  # Check for horizontal attacking coordinates
  # by default it wil be false as it is generic piece matcher
  def attacking_horizontal?
    false
  end
end
