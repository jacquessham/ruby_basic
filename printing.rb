# Lesson 1.3 Printing


# Begin and end statment
BEGIN{print"This is Lesson 3, we are going over printing in Ruby"}
END{puts"This concludes Lesson 3"}
# To show the begin statement is a print statement 
puts" <- This is a print function"
# Print a calculation in a string
puts"First, print a numeric variable in the next line"
puts"Factorial of 5 is #{5*4*3*2*1}"
=begin 
In Ruby, you should use double quotation for string.
If you reply the last puts function with single quotation will not work
=end
puts"This is what it will happen if you puts the last statement in single quotation:"
puts'Factorial of 5 is #{5*4*3*2*1}'
puts"Remember, if you embed a math formula or variable in string, use double quotation"
# Print 2+ variables in a string
orange = 4
orange_price = 0.78
apple = 8
apple_price =0.46
tax_rate = 0.0925
total = '%.2f' % (orange*orange_price+apple*apple_price)
total_plustax = '%.2f' % ((orange*orange_price+apple*apple_price) \
	                       *(1.0+tax_rate))

puts "There are #{orange} oranges and #{apple} apples"
print "It costs $#{orange*orange_price} for oranges "
puts "and $#{apple*apple_price} for apples"
puts "The total for the apples and oranges is $#{total}"
puts "The sales tax rate is #{tax_rate*100}%"
puts "However, you are not paying $#{total_plustax} because"+
     " California does not charge sales tax on produces"

=begin
The expected output is:	
This is Lesson 3, we are going over printing in Ruby <- This is a print function
First, print a numeric variable in the next line
Factorial of 5 is 120
This is what it will happen if you puts the last statement in single quotation:
Factorial of 5 is #{5*4*3*2*1}
Remember, if you embed a math formula or variable in string, use double quotation
There are 4 oranges and 8 apples
It costs $3.12 for oranges and $3.68 for apples
The total for the apples and oranges is $6.80
he sales tax rate is 9.25%
However, you are not paying $7.43 because California does 
 not charge sales tax on produces
=end