require 'spec_helper'
require_relative '../lib/piece'
require_relative '../lib/queen'

RSpec.describe Queen do
  def matcher(sets)
    pair = sets.map do |coordinates|
      Piece.new.tap do |piece|
        piece.coordinates = coordinates
      end
    end
    Queen.new(pair).attacking?
  end

  describe '#attacking?' do
    it 'check horizontally attacking queens' do
      expect(matcher([[1, 2], [1, 8]])).to be true
    end

    it 'check vertically attacking queens' do
      expect(matcher([[12, 8], [10, 8]])).to be true
    end

    it 'check diagonally attacking queens' do
      expect(matcher([[3, 2], [8, 7]])).to be true
    end

    it 'returns false if queens cannot attack' do
      expect(matcher([[1, 1], [5, 8]])).to be false
    end
  end
end
