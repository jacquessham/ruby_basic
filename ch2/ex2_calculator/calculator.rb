class Calculator
	def initialize(num1, num2, mode=nil)
		@num1 = num1
		@num2 = num2
		@mode = mode # Need to convert string to +-*/ later
	end # end constructor

	def calculate
		if @mode == nil then return nil end
		return @num1.method(@mode).(@num2)
	end
end # end class

class Distance < Calculator
	def initialize(num1, num2)
		# num1 = (x1, x2), num2 = (y1, y2)
		super(num1, num2)
	end

	def calculate
		return ((num1[1]-num1[0])**2+(num2[1]-num2[0])**2)**0.5
	end
end # end class

class BasicOperations < Calculator
	def initialize(num1, num2, mode)
		# Need to convert string to +-*/ later
		super
	end # end constructor
end # end class

class Statistics < Calculator
	def initialize(nums)
		# Need to check if all elements in nums are integers
		super(nums) # num1 is now to store array
	end # end constructor

	def calculate
		result = {}
		total = 0.0
		min = 0
		max = 0

		for num in @num1 do
			total += num
			if num < min then min = num end
			if num > max then max = num end
		end # end for

		result["average"] = total/@num1.size
		result["minimum"] = min
		result['maximum'] = max

		# Find median
		num_sorted = @num1.sort
		if @num1 % 2 == 1
			then result["median"] = @num1[@num1.size/2+1]
		else
			result["median"] = (@num1[@num1.size/2] + @num1[@num1.size/2+1])/2
		end # end if

		# Find SD
		total = 0.0
		for num in @num1 do
			total += (num - result["average"])**2
		end # end for
		result["standard_deviation"] = (total/@num1.size)**0.5
	end # end method
end

class FuelCost < Calculator
	def initialize(miles, mpg, price)
		# num1 = miles, num2 = mpg, num3 = price
		super(miles,mpg)
		@num3 = price
	end # end constructor

	def calculate
		return @num1*@num3/@num2
	end
end # end for

class GeoCalculator < Calculator
	def initialize(num1, num2, mode)
		super
	end # end constructor

end # end class