require 'spec_helper'

describe Table do
  before do
    @table = Table.new
  end

  describe 'Valid current position and direction of an object' do
    it 'should valid if a coordinate sits within boundary' do
      expect(@table.valid_location?(4, 3)).to eq true
      expect(@table.valid_location?(5, 3)).to eq false
    end

    it 'should valid if a direction is legit' do
      expect(@table.valid_direction?('NORTH')).to eq true
      expect(@table.valid_direction?('NORTHEAST')).to eq false
    end
  end
end