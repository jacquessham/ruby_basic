# Lesson 1.8 Inputs and Outputs

BEGIN{puts "This is Lesson 8, we are going inputs and outputs in Ruby"}
END{puts "This concludes Lesson 8"}

# Get inputs from users direct
# Ask user to enter for name and age
puts "Please enter your name:"
username = gets.chomp
puts "Please neter your age:"
age = gets.chomp.to_i
puts "#{username} is #{age} years old"