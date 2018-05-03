require './lib/chessboard'
require './lib/matcher'
require 'httparty'
require 'net/http'
require 'pry'
# Piece matcher main class
class PieceMatcher
  def initialize(ip)
    @ip = ip
    error_message = 'Whoops, no input is specified. Please specify ip'
    raise ArgumentError, error_message if @ip.nil? || @ip.empty?
  end

  def queen_matcher
    # Create the board and assign its pieces.
    chessboard = Chessboard.new(board_size)
    # This is for queen matcher as this method is matches queens coordinates
    piece_type = 'Queen'
    matches = chessboard.attacking_coordinates(piece_type)
    matches.any? ? matches : 'true'
  end

  private

  def board_size
    latitude.first.to_i
  end

  def latitude
    coordinates = HTTParty.get("http://ipinfo.io/#{@ip}")
    if !coordinates['error'].nil?
      raise HTTParty::ResponseError, coordinates['error']['message']
    end
    coordinates['loc'].split(',')
  end
end
