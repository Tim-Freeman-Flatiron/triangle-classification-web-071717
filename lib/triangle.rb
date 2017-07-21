require 'pry'

class Triangle
  
  attr_reader :side_1, :side_2, :side_3

	def initialize(side_1, side_2, side_3)
		@side_1 = side_1
		@side_2 = side_2
		@side_3 = side_3
		@all_sides = [@side_1,@side_2,@side_3]
	end

	def all_sides
		@all_sides		
	end

	def has_zero_or_neg_sides
		self.all_sides.any?{|s| s <= 0}
	end


	def meets_inequality_law?
		sorted_sides = self.all_sides.sort
		larg_side = sorted_sides.pop
		(larg_side < sorted_sides[0] + sorted_sides[1])
	end

	def kind
		if !meets_inequality_law?
			raise TriangleError
		elsif has_zero_or_neg_sides
			raise TriangleError
		elsif equilateral?
			:equilateral
		elsif isosceles?
			:isosceles
		elsif scalene?
			:scalene
		end
	end

	def equilateral?
		self.all_sides.uniq.length == 1
	end

	def isosceles?
		self.all_sides.uniq.length == 2
	end

	def scalene?
		self.all_sides.uniq.length == 3
	end

end

class TriangleError < StandardError

end