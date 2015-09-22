require 'minitest/autorun'
require 'pry'

class Triangle
  def initialize x,y,z
    @sides = [x,y,z]
  end

  def a
    @sides[0]
  end
  def b
    @sides[1]
  end
  def c
    @sides[2]
  end

  def perimeter
    a + b + c
  end

  def type
    if @sides.uniq.count == 1
      "equilateral"
    elsif @sides.uniq.count == 2
      "isosceles"
    else
      "scalene"
    end
  end
end


class TriangleTest < Minitest::Test
  def test_triangles_can_determine_their_sides
    t = Triangle.new(3,4,5)
    # t.a => 3
    assert_equal 3, t.a
  end

  def test_triangles_have_a_perimeter
    t = Triangle.new(5,12,13)
    assert_equal 30, t.perimeter
  end

  def test_equilateral_triangles
    t = Triangle.new(3,3,3)
    assert_equal "equilateral", t.type

    s = Triangle.new(5,5,8)
    assert_equal "isosceles", s.type

    u = Triangle.new(5,7,5)
    assert_equal "isosceles", u.type

    v = Triangle.new(8,9,10)
    assert_equal "scalene", v.type
  end
end
