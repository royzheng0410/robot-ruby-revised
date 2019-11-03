require 'spec_helper'

describe Robot do
  before do
    @table = Table.new
    @position = Position.new(table: @table)
    @position.relocate(x_axis: 1, y_axis: 1, facing: 'NORTH')
    @report = Report.new
    @robot = Robot.new(position: @position, report: @report)
    
  end

  describe 'Accept commands' do
    it 'should accept place command' do
      @command = Command.new(command: "PLACE 1,1,NORTH", robot: @robot)
      expect(@position).to receive(:relocate).with(@command.start_point)
      @robot.execute(@command)
    end

    it 'should accept move command' do
      @command = Command.new(command: "MOVE", robot: @robot)
      expect(@position).to receive(:move_forward)
      @robot.execute(@command)
    end

    it 'should accept rotate command' do
      @command = Command.new(command: "RIGHT", robot: @robot)
      expect(@position).to receive(:turn).with('right')
      @robot.execute(@command)
    end

    it 'should accept report command' do
      @command = Command.new(command: "REPORT", robot: @robot)
      expect(@report).to receive(:report_position).with(@robot)
      @robot.execute(@command)
    end

    it 'should return error message if command is invalid' do
      @command = Command.new(command: "TEST", robot: @robot)
      expect(@robot.execute(@command)).to eq 'Invalid commands'
    end
  end

  describe 'Utils' do
    it 'should return x axis value' do
      expect(@position).to receive(:x_axis)
      @robot.x_axis
    end

    it 'should return y axis value' do
      expect(@position).to receive(:y_axis)
      @robot.y_axis
    end

    it 'should return direction' do
      expect(@position).to receive(:facing_to_s)
      @robot.direction
    end

    it 'should return it is placed or not' do
      expect(@position).to receive(:not_placed?)
      @robot.not_placed?
    end
  end
end