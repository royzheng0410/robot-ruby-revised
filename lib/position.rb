class Position
  FACING = {'NORTH' => 0, 'EAST' => 1, 'SOUTH' => 2, 'WEST' => 3}
  attr_reader :x_axis, :y_axis, :facing, :table

  def initialize(args = {})
    @table = args[:table]
  end

  def relocate(args = {})
    if table.valid_location?(args[:x_axis], args[:y_axis]) && table.valid_direction?(args[:facing])
      @x_axis = args[:x_axis]
      @y_axis = args[:y_axis]
      @facing = FACING[args[:facing]]
      nil
    else
      return 'Invalid position'
    end
  end

  def move_forward
    current_x = @x_axis
    current_y = @y_axis
    update_location
    unless table.valid_location?(@x_axis, @y_axis)
      @x_axis = current_x
      @y_axis = current_y
      return 'Cannot move any further from this direction.'
    end
    nil
  end

  def turn(direction)
    facing_values = FACING.values
    case direction
    when 'left'
      @facing = facing_values[facing - 1]
    when 'right'
      @facing = facing_values[(facing + 1) % facing_values.size]
    end
    nil
  end

  def facing_to_s
    FACING.key(facing)
  end

  def not_placed?
    x_axis.nil? || y_axis.nil? || facing.nil?
  end

  private
  
  def update_location
    case facing
    when FACING['NORTH']
      @y_axis += 1
    when FACING['SOUTH']
      @y_axis -= 1
    when FACING['WEST']
      @x_axis -= 1
    when FACING['EAST']
      @x_axis += 1
    end
  end
end