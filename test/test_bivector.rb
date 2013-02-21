require 'test/unit'
require 'bivector'

class BivectorTest < Test::Unit::TestCase
  def setup
    @v1 = Bivector.new(1, 0)
    @v2 = Bivector.new(3, 3)
    @v3 = Bivector.new(3, 4)
    @v4 = Bivector.new(-1 ,1)
    @v5 = Bivector.new(-1, -1)
    @zero_vector = Bivector.new(0, 0)
  end

  def test_plus
    expect = Bivector.new(4, 4)
    result = @v1 + @v3
    assert(expect == result)
  end

  def test_minus
    expect = Bivector.new(4, 5)
    result = @v3 - @v5
    assert(expect == result)
  end

  def test_mutiplied_by_a_number
    expect = Bivector.new(1.5, 2)
    result = @v3 * 0.5
    assert(expect == result)
  end

  def test_norm
    assert_equal 5, @v3.norm
    assert_equal 5, @v3.length
  end

  def test_is_zero_vector
    assert @zero_vector.zero?
    assert @zero_vector.null_vector?
  end

  def test_dot_product
    assert_equal 3, @v1.dot_product(@v2)
    assert_equal -7, @v3.dot_product(@v5)
  end

  def test_angles_calculation
    assert_in_delta 45, @v1.angles_to(@v2, :ang), 0.0001
    assert_in_delta 90, @v2.angles_to(@v4, :ang), 0.0001
    assert_in_delta 135, @v1.angles_to(@v4, :ang), 0.0001
    assert_in_delta 180, @v2.angles_to(@v5, :ang), 0.0001
  end

  def test_parallel
    assert @v2.parallels_to? @v5
  end

  def test_perpendicular
    assert @v2.perpendicular_to?(@v4)
  end

  def test_theta
    assert_in_delta 0, @v1.theta, 0.0001
    assert_in_delta 225, @v5.theta * 180 / Math::PI, 0.0001
  end
end
