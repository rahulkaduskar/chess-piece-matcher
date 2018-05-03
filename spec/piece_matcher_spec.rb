require 'spec_helper'
require './lib/piece_matcher'

RSpec.describe PieceMatcher do
  let(:piece_matcher) { PieceMatcher.new('8.8.8.8') }

  describe '# get board size' do
    it 'returns Integer' do
      value = piece_matcher.send(:board_size)
      expect(value).to be_kind_of(Integer)
    end
  end
  describe '#queen matcher' do
    it 'returns either an array or string' do
      value = piece_matcher.queen_matcher
      expect(value).to be_kind_of(Array)
    end
  end
end
