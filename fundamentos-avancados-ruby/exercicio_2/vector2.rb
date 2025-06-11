class Vector2

  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def *(other)
    if other.is_a? Numeric
      "(#{@x * other}, #{@y * other})"
    elsif other.is_a? Vector2
      (other.x * @x) + (other.y * @y)
    end
  end
end

class Integer
  alias :original_method :*

  def *(other)
    if other.is_a? Vector2
      "(#{other.x * self}, #{other.y * self})"
    else
      original_method(other)
    end
  end
end

class Float
  alias :original_method :*

  def *(other)
    if other.is_a? Vector2
      "(#{other.x * self}, #{other.y * self})"
    else
      original_method(other)
    end
  end
end

v = Vector2.new(3, 4)
puts v * 2 # Output: (6, 8)
puts v * 2.5 # Output: (7.5, 10.0)
puts v * v # Output: 25 (dot product)
puts 2 * v # Output: (6, 8)
puts 2.5 * v # Output: (7.5, 10.0)