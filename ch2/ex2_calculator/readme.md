# Exercise 2 Calculator

The goal of this exercise is to practice declaring classes in Ruby. We are going to build a calculator for various purpose. This exercise is inspired from the homework Lab 1 of CS 112 from the University of San Francisco.

## Requirements
<ol>
	<li>Create a superclass Calculator to operate basic mathematical operations</li>
	<li>Create a subclass to calculate distance</li>
	<li>Create a subclass to calculate statistics</li>
	<li>Create a subclass to calculate annual fuel cost</li>
	<li>Create a subclass to operate geometrical calculation</li>
</ol>

### Calculate distance
Create a subclass called <b>Distance</b>. Ask user to enter two points: <i>x</i> and <i>y</i> and save in the object. Declare a method to compute the distance between <i>x</i> and <i>y</i> points using the following formula:
d = sqrt((x2-x1)^2 + (y2-y1)^2)
Save the result as an attribute in the object and print it on the console.

### Operate basic mathematical operations
Create a super class called <b>BasicOperations</b> BasicOperations class. Ask users to enter <i>x</i>, <i>y</i>, and the desired operation. Declare a method for the operation and save the result as an attribute in the object. Print it on the console afterward.

### Calculate Statistics
Create a subclass called <b>Statistics</b>. Prompt the user to enter 5 integers and display the average, minimum, maximum, median, standard deviation and save the result as attributes in the object. Print it on the console afterward.

### Calculate Annual Fuel Cost
Create a subclass called <b>FuelCost</b> to computes the cost of fuel for your car in one year. The program should prompt the user to enter the following information:
<ul>
	<li>Number of miles driven in a year</li>
	<li>MPG</li>
	<li>Price of gas per gallon</li>
</ul>
Declare a method to calculate and save as attribute in the object, print the annual cost afterward. Use the formula: fuelCost = numMiles * pricePerGallon / milesPerGallon

### Operate geometrical calculation
Write a subclass called <b>GeoCalculator</b> that contains instance data and type of shape, including:
<ul>
<li>Cube</li>
<li>Cuboid</li>
<li>Sphere</li>	
<li>Cone</li>
<li>Square Pyramid</li>
<li>Cylinder</li>
</ul>
Ask users what shape to calculate and the instance data before initialize the object, calculate the volume and surface area and save the result as attributes in the object, print the result on the console afterward. Creating subclass for each shape is allowed.

### Main Script
After define the classes above, run scripts to declare all classes above at least once. 

## Classes in the Script
Required file: <i>calculator.rb</i>
<br><br>
<i>calculator.rb</i> has included all classes which would be fulfilling the requirement of the previous sections. The classes are:
<ul>
	<li>Calculator (Superclass)</li>
	<li>Distance</li>
	<li>BasicOperation</li>
	<li>Statistics</li>
	<li>FuelCost</li>
	<li>GeoCalculator</li>
</ul>
<br>
Besides <i>Calculator</i> itself, all other classes are child class of <i>Calculator</i>.

### Calculator (Superclass)
Parameters:
<ul>
	<li>num1: 1st number</li>
	<li>num2: 2nd number</li>
	<li>mode: choose: +,-,*,/,"Statistics"</li>
</ul>
<br>
Method:
<br>
calculate - Operate a calculation between num1 and num2 by the mode. If mode is not provided, it will return nil
<br>
Note: Parameters are optional, if any of the instances (num1, num2, mode) is nil, it will return nil when calculate is called. Only numbers are allowed for num1 and num2, if it is not, it will convert to nil. If mode is "Statistics", it permits num1 be an array instead of numeric.

### Distance
Parameters:
<ul>
	<li>num1: 1st point, must be Array with 2 numbers (Mandatory)</li>
	<li>num2: 2nd point, must be Array with 2 numbers (Mandatory)</li>
</ul>
calculate - Calculate an Euclidean distance between two points (Each array represent a point, with x and y coordinate)
<br>
Note: num1 and num2 must be array with 2 numbers, if either of those is not an array with 2 numbers, it will convert to nil. If either num1 and num2 is nil, it will return nil.

### BasicOperation
Parameters:
<ul>
	<li>num1: 1st number (Mandatory)</li>
	<li>num2: 2nd number (Mandatory)</li>
	<li>mode: choose: +,-,*,/ (Mandatory)</li>
</ul>
<br>
Method:
<br>
calculate - Operate a calculation between num1 and num2 by the mode. 
<br>
Note: Parameters are mandatory, if mode is not one of the options listed above, it will convert to +. Likewise, if num1 and num2 are not numbers, it will convert to 0. Different with its superclass, all parameters must be entered when creating this object.

### Statistics
Parameters:
<br>
num1: List of integers (Mandatory)
<br>
calculate - Return a hash, contains average, minimum, maximum, median, and standard deviation of the list of integers from num1. If there is nothing or no integer in num1, it will return nil instead.
<br>
Note: Parameter is mandatory to be an array. If it is not an array, it will convert to an empty array. When initialize num1, it will check every element in the array whether the element is an integer; if it is not an integer, the element will be dropped.

### FuelCost
Parameters:
<ul>
	<li>miles: Miles driven</li>
	<li>mpg: Miles per gallon of a car</li>
	<li>price: Gasoline Price</li>
</ul>
<br>
calculate - Return the cost of estimate gasoline expense in numbers.
<br>
Note: miles becomes num1; mpg becomes mpg; it will store a extra num3 variable to represent price. mode will be empty when calling super. The parameters are optional. However, if one of the parameters is nil, the calculation will return nil. 

### GeoCalculator
Parameters:
<ul>
	<li>mode: The shape user wishes to calculate</li>
	<li>num1: 1st number (See subsection for detail)</li>
	<li>num2: 2nd number (See subsection for detail)</li>
	<li>num3: 3rd number (See subsection for detail)</li>
</ul>
calculate - Return a hash with the calculation of volume and surface area according to mode. If mode is nil or unknown shape, it will return nil for both volume and surface area. See subsection for requirements for each shape.
<br>
Note: This class only takes: <b>cube</b>, <b>cuboid</b>, <b>sphere</b>, <b>cone</b>, <b>square pyramid</b>, and <b>cylinder</b>. All other input becomes nil. When mode is nil, it will return a hash where volume and surface area will be nil. If the num1, num2, num3 required by the mode is not numerics, it will convert to 0. Therefore, any invalid input will yield to volume and surface area be both 0's.

### Cube
Parameters:
<ul>
	<li>mode: Use "cube"</li>
	<li>num1: Length</li>
</ul>

### Cuboid
Parameters:
<ul>
	<li>mode: Use "Cuboid"</li>
	<li>num1: Length</li>
	<li>num2: Weight</li>
	<li>num3: Height</li>
</ul>

### Sphere
Parameters:
<ul>
	<li>mode: Use "sphere"</li>
	<li>num1: Radius</li>
</ul>

### Cone
Parameters:
<ul>
	<li>mode: Use "cone"</li>
	<li>num1: Radius</li>
	<li>num2: Height</li>
</ul>

### Square Pyramid
Parameters:
<ul>
	<li>mode: Use "square pyramid"</li>
	<li>num1: Base Length</li>
	<li>num2: Height</li>
</ul>

### Cylinder
Parameters:
<ul>
	<li>mode: Use "cylinder"</li>
	<li>num1: Radius</li>
	<li>num2: Height</li>
</ul>
