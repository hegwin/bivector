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
    if another.is_a? Bivector
      x * another.x + y * another.y
    end
  end
  alias :inner_product :dot_product

  def cross_product(another)
    if another.is_a? Bivector
      Bivector.new()
    end
  end
  alias :outer_product :cross_product

  def unit_vector
    return nil if self.zero?
    Bivector.new(x / norm, y / norm)
  end

  def angles_to(another, style = 'rad')
    if another.is_a? Bivector
      angle = Math.acos(dot_product(another) / ( norm * another.norm))
      case style
      when 'rad'
        return angle
      when 'ang'
        return angle * 360 / Math::PI
      end
    end
  end
end
