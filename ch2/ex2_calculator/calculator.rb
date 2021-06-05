class Calculator
	def initialize(num1=nil, num2=nil, mode=nil)
		@num1 = num1
		@num2 = num2
		@mode = mode
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
	end # end constructor

	def calculate
		return ((@num2[1]-@num1[1])**2+(@num2[0]-@num1[0])**2)**0.5
	end # end function
end # end class

class BasicOperations < Calculator
	def initialize(num1, num2, mode)
		# Need to convert string to +-*/ later
		if !["+","-","*","/"].include?(mode)
			then puts "Invalid mode, converting to +"; mode="+"
		super
		end # end if 
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
		if @num1.size % 2 == 1
			then result["median"] = @num1[@num1.size/2]
		else
			result["median"] = (@num1[@num1.size/2] + @num1[@num1.size/2-1])/2
		end # end if

		# Find SD
		total = 0.0
		for num in @num1 do
			total += (num - result["average"])**2
		end # end for
		result["standard_deviation"] = (total/@num1.size)**0.5
		return result
	end # end method
end # end class

class FuelCost < Calculator
	def initialize(miles=nil, mpg=nil, price=nil)
		# num1 = miles, num2 = mpg, num3 = price
		super(miles,mpg)
		@num3 = price
	end # end constructor

	def calculate
		if @num2 == 0 or @num2 == nil then return nil end
		return @num1*@num3/@num2
	end
end # end for

class GeoCalculator < Calculator
	def initialize(mode=nil, num1=nil, num2=nil, num3=nil)
		if mode != nil then mode = mode.downcase end
		if mode == "cube"
			then super(num1, nil, mode)
		elsif mode == "cuboid"
			then super(num1, num2, mode); @num3 = num3
		elsif mode == "sphere"
			then super(num1, nil, mode)
		elsif mode == "cone"
			then super(num1, num2, mode) # num1 = r, num2 = h
		elsif mode == "square pyramid"
			then super(num1, num2, mode) # num1 = l, num2 = h
		elsif mode == "cylinder"
			then super(num1, num2, mode) # num1 = r, num2 = h
		else # All else become cube
			puts "Unknown Mode received"
			super(num1, num2, mode)
		end # end if
	end # end constructor

	def calculate
		if @mode == "cube"
			then volume = @num1**3; surface_area = 6*(@num1**2)
		elsif @mode == "cuboid"
			then volume = @num1*@num2*@num3
				 surface_area = 2*@num1*@num2 + 2*@num1*@num3 + 2*@num2*@num3
		elsif @mode == "sphere"
			then volume = (4/3)*Math::PI*(@num1**3)
				 surface_area = 4*Math::PI*(@num1**2)
		elsif @mode == "cone"
			# num1 = r, num2 = h
			then volume = (@num2/3.0)*Math::PI*(@num1**2)
				 surface_area = Math::PI*@num1*(@num1 + (@num1**2 + @num2**2)**0.5)
		elsif @mode == "square pyramid"
			# num1 = l, num2 = h
			then volume = (@num1**2)*@num2/3.0
				 surface_area = @num1**2 + 2.0*@num1*((@num1**2)/4+@num2**2)**0.5
		elsif @mode == "cylinder"
			# num1 = r, num2 = h
			then volume = Math::PI*(@num1**2)*@num2
				 surface_area = 2.0*Math::PI*@num1*@num2 + 2.0*Math::PI*@num1**2
		else # All else become cube
			volume = nil
			surface_area = nil
		end # end if
		result = {}
		result["volume"] = volume
		result["surface_area"] = surface_area
		return result
	end # end function

end # end class

# Test Super class
supercalculator = Calculator.new(1,2,"+")
puts "Super class: #{supercalculator.calculate}"

# Test Distance
distance = Distance.new([0,0],[1,1])
puts "Distance: #{distance.calculate}"

# Test Statistics
stats = Statistics.new([0,4,7,13,15,28])
stats_results = stats.calculate
puts "Statistics average: #{stats_results["average"]}"
puts "Statistics minimum: #{stats_results["minimum"]}"
puts "Statistics maximum: #{stats_results["maximum"]}"
puts "Statistics median: #{stats_results["median"]}"
puts "Statistics standard deviation: #{stats_results["standard_deviation"]}"

# Test Fuel Cost
fuelcost = FuelCost.new(60,30,2)
puts "Fuel Cost: $#{fuelcost.calculate}"

# Test GeoCalculator Cube
cube = GeoCalculator.new("cube",2)
puts "Cube Volume: #{cube.calculate["volume"]}"
puts "Cube Surface Area: #{cube.calculate["surface_area"]}"

# Test GeoCalculator Cuboid
cuboid = GeoCalculator.new("cuboid",2,3,4)
puts "Cuboid Volume: #{cuboid.calculate["volume"]}"
puts "Cuboid Surface Area: #{cuboid.calculate["surface_area"]}"

# Test GeoCalculator Sphere
sphere = GeoCalculator.new("sphere",2)
puts "Sphere Volume: #{sphere.calculate["volume"]}"
puts "Sphere Surface Area: #{sphere.calculate["surface_area"]}"

# Test GeoCalculator Cone
cone = GeoCalculator.new("Cone",10,2)
puts "Cone Volume: #{cone.calculate["volume"]}"
puts "Cone Surface Area: #{cone.calculate["surface_area"]}"

# Test GeoCalculator Square Pyramid
sp = GeoCalculator.new("square pyramid",10,2)
puts "Square Pyramid Volume: #{sp.calculate["volume"]}"
puts "Square Pyramid Surface Area: #{sp.calculate["surface_area"]}"

# Test GeoCalculator Cylinder
cylinder = GeoCalculator.new("cylinder",10,2)
puts "Cylinder Volume: #{cylinder.calculate["volume"]}"
puts "Cylinder Surface Area: #{cylinder.calculate["surface_area"]}"
