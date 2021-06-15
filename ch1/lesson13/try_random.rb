# Lesson 13: Random

# Begin and end statment
BEGIN{puts"This is Lesson 13, we are going over random generation in Ruby"}
END{puts"This concludes Lesson 13"}

puts "Generate a number between 0 and 1"
puts rand

a = 0
b = 10
puts "Generate a number between #{a} and #{b}"
puts rand(b)

c = 20
puts "Generate a number between #{b} and #{c}"
puts rand(b..c)

arr = [9, 22, 27, 39]
puts "Randomly pick a number from #{arr}"
puts arr.sample

arr2 = ('a'..'z').to_a
puts "Randomly pick a character from #{arr2}"
puts arr2.sample

puts "Randomly pick 2 character from #{arr2}"
puts arr2.sample(2)

puts "Generate an array of 10 numbers between #{a} and #{c}"
puts Array.new(10){rand(a..c)}

=begin
Expected Output
This is Lesson 13, we are going over random generation in Ruby
Generate a number between 0 and 1
<a number>
Generate a number between 0 and 10
<a number>
Generate a number between 10 and 20
<a number>
Randomly pick a number from [9, 22, 27, 39]
<a number>
Randomly pick a character from ['a'..'z']
<a character>
Randomly pick 2 characters from ['a'..'z']
<a character>
<a character>
Generate an array of 10 numbers between 0 and 20
<a number>
<a number>
<a number>
<a number>
<a number>
<a number>
<a number>
<a number>
<a number>
<a number>
This concludes Lesson 13
=end