# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
	sides = [a, b, c].sort
	max = sides.pop
	sum = sides.inject(&:+) # & makes what follows expected to be a Proc. symbols (like :+) have an inherent to_proc method
	# :+ == Proc.new { |x, y| x + y }

	raise TriangleError unless sum > max

  if a == b && b == c # & does not short circuit ie: it executes both conditionals
  	:equilateral # && both has to be true for it to return true, if one false, will return false
	elsif a == b || b == c || a == c # || short circuits, cuts off if the first conditional is false
		:isosceles
	else
		:scalene
	end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
