require 'spec_helper'

describe Position do
  before do
    @table = Table.new
    @position = Position.new(table: @table)
  end

  describe 'Place on table' do
    it 'should be placed on a position' do
      @position.relocate({x_axis: 1, y_axis: 1, facing: 'NORTH'})
      expect(@position.x_axis).to eq 1
      expect(@position.y_axis).to eq 1
      expect(@position.facing).to eq Position::FACING['NORTH']
    end

    it 'should return error message if position is invalid' do
      expect(@position.relocate({x_axis: 1, y_axis: 1, facing: 'NORTHEAST'})).to eq 'Invalid position'
    end
  end

  describe 'Utils' do
    it 'should return facing direction in type of string' do
      @position.relocate({x_axis: 1, y_axis: 1, facing: 'NORTH'})
      expect(@position.facing_to_s).to eq 'NORTH'
    end

    it 'should check if it has been placed or not' do
      expect(@position.not_placed?).to eq true
      @position.relocate({x_axis: 1, y_axis: 1, facing: 'NORTH'})
      expect(@position.not_placed?).to eq false
    end
  end

  describe 'React to commands' do 
    it 'should move forward if there is space' do
      @position.relocate({x_axis: 1, y_axis: 1, facing: 'NORTH'})
      @position.move_forward
      expect(@position.y_axis).to eq 2
    end

    it 'should ignore command and return error message if there is not enough space' do
      @position.relocate({x_axis: 1, y_axis: 4, facing: 'NORTH'})
      expect(@position.move_forward).to eq 'Cannot move any further from this direction.'
      expect(@position.y_axis).to eq 4
    end

    it 'should turn 90 digree to left or right based on command' do
      @position.relocate({x_axis: 1, y_axis: 1, facing: 'NORTH'})
      @position.turn('left')
      expect(@position.facing) == Position::FACING['WEST']
      @position.turn('right')
      expect(@position.facing) == Position::FACING['NORTH']
    end
  end
end