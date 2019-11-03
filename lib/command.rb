class Command
  attr_reader :command, :robot

  def initialize(args={})
    @command = args[:command]
    @robot = args[:robot]
  end

  def order
    command.split(' ').first
  end

  def start_point
    start_arr = command.split(' ').last.split(',')
    return {x_axis: start_arr[0].to_i, y_axis: start_arr[1].to_i, facing: start_arr[2]}
  end

  def prepare_execution
    if robot.not_placed? && not_place_command? 
      return 'Please place your robot first'
    else
      robot.execute(self)
    end   
  end

  private

  def not_place_command?
    order != 'PLACE'
  end
end