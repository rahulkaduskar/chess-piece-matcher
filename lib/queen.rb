require './lib/matcher'

# Queen piece matcher class
class Queen < Matcher
  # Check for diagonal attacking coordinates
  def attacking_diagonal?
    difference_on_axis(:x) == difference_on_axis(:y)
  end

  # Check for vertical attacking coordinates
  def attacking_vertical?
    attacking_axis?(:y)
  end

  # Check for horizontal attacking coordinates
  def attacking_horizontal?
    attacking_axis?(:x)
  end

  def attacking_axis?(axis)
    @pieces.map(&axis).reduce(&:==)
  end

  # Check for diagonal coordinates deference
  def difference_on_axis(axis)
    @pieces.map(&axis).reduce(&:-).abs
  end
end
