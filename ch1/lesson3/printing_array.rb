# Lesson 1.3 Printing Supplement 1


# Begin and end statment
BEGIN{print"This is Lesson 3 Supplement 1, we are going over printing in Ruby"}
END{puts"This concludes Lesson 3 Supplement 1"}

# Printing array
arr = ["Orange","Apple","Strawberry"]
puts "I am printing an array without converting array to string"
puts arr
puts "You can see each element was printed in each line"
puts "I am printing an array after converting array to string"
puts arr.to_s
puts "You can see the array was printed in one line"
