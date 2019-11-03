class Table
  MAX_X = 4
  MAX_Y = 4
  DIRECTION = ['NORTH', 'SOUTH', 'WEST', 'EAST']

  def valid_location?(x, y)
    x.between?(0, MAX_X) && y.between?(0, MAX_Y)
  end

  def valid_direction?(facing)
    DIRECTION.include?(facing)
  end
end