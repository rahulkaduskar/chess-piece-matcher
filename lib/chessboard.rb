require './lib/piece'
require './lib/queen'

# chessboard class for piece coordinates
class Chessboard
  attr_reader :size, :pieces, :coordinates, :number_of_pieces, :piece_type

  def initialize(size)
    @size = size
    @number_of_pieces = (@size / 2).floor
    @coordinates ||= []
    assign_pieces
  end

  # this method assign random coordinates to pieces
  def attacking_coordinates(piece_type = 'Queen')
    attacking_pairs(piece_type).map { |pair| pair.map(&:coordinates) }
  end

  private

  # this method assign random coordinates to pieces
  def assign_pieces
    @pieces = Array.new(@number_of_pieces).map do
      piece = assign_until_unique(Piece.new)
      coordinates << piece.coordinates
      piece
    end
  end

  # All possible pairs of pieces
  def pairs
    @pieces.combination(2).to_a
  end

  # returns possible unique coordinate piece
  def assign_until_unique(piece)
    x = Random.new.rand(1..@size)
    y = Random.new.rand(1..@size)
    unless coordinates.include? [x, y]
      piece.coordinates = [x, y]
      return piece
    end
    assign_until_unique(piece)
  end

  # Params matcher_type. this defines which type of attackings are possible.
  # Currently we allow only matcher_type = 'Queen'
  # returns find all possible atacking coordinate piece
  def attacking_pairs(matcher_type)
    pairs.select do |pair|
      matcher = Object.const_get(matcher_type).new(pair)
      matcher.attacking?
    end
  rescue StandardError
    raise ArgumentError, 'Unknown matcher_type. Please check matcher_type.'
  end
end
