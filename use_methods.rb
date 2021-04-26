# Lesson 1.4 Methods


# Methods with no parameters
def simple_method
	puts "We have received no parameter when this method is called"
end

# Methods with 1 parameter
def method_1para(apple=1)
	puts "This method is about apples"
	puts "We have received #{apple} apple(s) when this method is called"
end

# Methods with 2+ parameters
def method_2para(apple=1, orange=1)
	puts "This method is about apples and oranges"
	print "We have received #{apple} apple(s) and #{orange} orange(s)"
	puts "when this method is called"
end

# Method to return object
def method_return
return 800
end

# Method to return more than 1 object
def method_2returns
i = 100
j = 200
return i,j
end

# Begin and end statment
BEGIN{puts"This is Lesson 4, we are going over methods in Ruby"}
END{puts"This concludes Lesson 4"}

# Execute the methods
puts "Excute simple_method"
simple_method
puts "----------------------------------------------"
puts "Excute method_1para"
method_1para # No parameter passed, the method will use defaulted value
puts "----------------------------------------------"
puts "Excute method_2para"
method_2para(10,2)
puts "----------------------------------------------"
puts "Excute method_return"
num1 = method_return
puts "I have received #{num1} from method_return"
puts "----------------------------------------------"
puts "Excute method_2returns"
num1, num2 = method_2returns
puts "I have received #{num1} and #{num2} from method_2returns"


=begin
The expected output is:
This is Lesson 4, we are going over methods in Ruby
Excute simple_method
We have received no parameter when this method is called
----------------------------------------------
Excute method_1para
This method is about apples
We have received 1 apple(s) when this method is called
----------------------------------------------
Excute method_2para
This method is about apples and oranges
We have received 10 apple(s) and 2 orange(s) 
 when this method is called
----------------------------------------------
Excute method_return
I have received 800 from method_return
----------------------------------------------
Excute method_2returns
I have received 100 and 200 from method_2returns
This concludes Lesson 4
=end
