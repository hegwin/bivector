class Bivector
  attr_accessor :x, :y

  def initialize(xCoordinate, yCoordinate)
    @x, @y = xCoordinate, yCoordinate
  end

  def +(another)
    if another.is_a? Bivector
      Bivector.new(self.x + another.x, self.y + another.y)
    end
  end
end
