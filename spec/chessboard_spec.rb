require 'spec_helper'
require './lib/chessboard'

RSpec.describe Chessboard do
  let(:board) { Chessboard.new(8) }

  describe '#assign_pieces!' do
    it 'assigns n/2 pieces' do
      expect(board.pieces.count).to eq 4
    end

    it 'assigns coordinates to a piece' do
      %i[x y].each do |coord|
        expect(board.pieces.first.public_send(coord)).not_to be_nil
      end
    end

    it 'assigns unique coordinates' do
      coordinates = board.pieces.map(&:coordinates)
      expect(coordinates.uniq).to eq coordinates
    end
  end
end
