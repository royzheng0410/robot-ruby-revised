require 'pry'
require_relative 'lib/robot'
require_relative 'lib/command'
require_relative 'lib/report'
require_relative 'lib/table'
require_relative 'lib/position'
report = Report.new
table = Table.new
position = Position.new(table: table)
robot = Robot.new(report: report, position: position)
puts 'Please enter your commands:'
command = gets
while command
  step = Command.new(command: command, robot: robot)
  result = step.prepare_execution
  puts result unless result.nil?
  command = gets 
end