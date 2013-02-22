class Bivector
  attr_accessor :x, :y

  def initialize(xCoordinate, yCoordinate)
    @x, @y = xCoordinate, yCoordinate
  end
  
  def to_s
    "(#{x}, #{y})"
  end
  
  def ==(another)
    another.is_a?(Bivector) && x == another.x && y == another.y
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
    if aNumber.is_a? Numeric
      Bivector.new(x * aNumber, y * aNumber)
    end
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

  def angles_to(another, style = :rad)
    if another.is_a? Bivector
      BV::Angle.new(Math.acos(dot_product(another) / ( norm * another.norm))).values_in(style)
    end
  end
  
  def parallels_to?(another)
    if another.is_a? Bivector
      self.zero? || another.zero? || x * another.y - y * another.x == 0
    end
  end
  
  def perpendicular_to?(another)
    if another.is_a? Bivector
      self.dot_product(another) == 0
    end
  end

  def theta(style = :rad)
    BV::Angle.new(Math.atan(y/x)).values_in(style)
  end

  def polar
    "(#{norm}, #{theta})"
  end
end

module BV
  class Angle
    attr :value, :model

    def initialize(value, model = :rad)
      @value = value
      @model = model
    end

    def to_s
      value
    end

    def switch_model
      case model
      when :ang then rad_value
      when :rad then ang_value
      end 
    end

    def rad_value
      model == :rad ? value : value * Math::PI / 180
    end

    def ang_value
      model == :ang ? value : value * 180 / Math::PI
    end

    def values_in(style = :rad)
      style == model ? value : switch_model
    end

    def tan
      Math.tan(self.rad_value)
    end
  end
end
