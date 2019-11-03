require 'spec_helper'

describe Report do
  before do
    @table = Table.new
    @position = Position.new(table: @table)
    @position.relocate(x_axis: 1, y_axis: 1, facing: 'NORTH')
    @robot = Robot.new(position: @position)
  end

  describe 'Output Object Position' do
    it 'should print object position' do
      @report = Report.new
      expect(@report.report_position(@robot)).to eq 'Output: 1,1,NORTH'
    end
  end
end