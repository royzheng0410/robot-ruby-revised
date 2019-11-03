class Robot
  VALID_COMMAND = {:place => 'PLACE', :move => 'MOVE', :left => 'LEFT', :right => 'RIGHT', :report => 'REPORT', :exit => 'EXIT'}
  attr_accessor :position, :report

  def initialize(args={})
    @report = args[:report]
    @position = args[:position]
  end
  
  def execute(command)	
    case command.order
    when VALID_COMMAND[:place]
      update_position(command.start_point)
    when VALID_COMMAND[:move]
      move
    when VALID_COMMAND[:left]
      turn('left')
    when VALID_COMMAND[:right]
      turn('right')
    when VALID_COMMAND[:report]
      report_position
    when VALID_COMMAND[:exit]
      exit
    else
      return 'Invalid commands'
    end
  end

  def x_axis
    position.x_axis
  end

  def y_axis
    position.y_axis
  end

  def direction
    position.facing_to_s
  end

  def update_position(start_point)
    position.relocate(start_point)
  end

  def move
    position.move_forward
  end

  def turn(direction)
    position.turn(direction)
  end

  def report_position
    report.report_position(self)
  end

  def not_placed?
    position.not_placed?
  end
end
