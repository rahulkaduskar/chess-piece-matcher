require 'spec_helper'
require './lib/piece'
require './lib/queen'
require 'pry'

RSpec.describe Matcher do
  def matcher(sets)
    pair = sets.map do |coordinates|
      Piece.new.tap do |piece|
        piece.coordinates = coordinates
      end
    end
    Matcher.new(pair).attacking?
  end

  describe '#attacking?' do
    it 'understands horizontally attacking piece' do
      expect(matcher([[2, 5], [2, 8]])).to be false
    end

    it 'understands vertically attacking piece' do
      expect(matcher([[2, 5], [2, 8]])).to be false
    end

    it 'understands diagonally attacking piece' do
      expect(matcher([[2, 5], [2, 8]])).to be false
    end

    it 'returns false if piece cannot attack' do
      expect(matcher([[2, 5], [2, 8]])).to be false
    end
  end
end
