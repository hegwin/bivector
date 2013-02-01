class Bivector
  attr_accessor :x, :y

  def initialize(xCoordinate, yCoordinate)
    @x, @y = xCoordinate, yCoordinate
  end

  def +(another)
    if another.is_a? Bivector
      Bivector.new(x + another.x, y + another.y)
    end
  end

  def -(another)
    if another.is_a? Bivector
      Bivector.new(x - another.x, y - another.y)
    end
  end

  def *(aNumber)
  end

  def norm
    (x**2 + y**2)**0.5
  end
  alias :length :norm 

  def zero?
    return (x == 0 && y ==0) ? true : false
  end
  alias :zero_vector? :zero?
  alias :null_vector? :zero?

  def dot_product(another)
  end

  def cross_product(another)
  end

  def unit_vector
    return nil if self.zero?
    Bivector.new(x / self.norm, y / self.norm)
  end
end
