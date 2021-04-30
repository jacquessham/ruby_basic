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

## Coming Soon...