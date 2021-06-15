# Lesson 1.14: Converting between Data Types

BEGIN{puts "This is Lesson 14, we are going over how to convert between data types in Ruby"}
END{puts "This concludes Lesson 14"}

# From string to numbers
str1 = "1.04"
puts "#{str1} is #{str1.class}"
puts "#{str1.to_i} is #{str1.to_i.class}"
puts "#{str1.to_f} is #{str1.to_f.class}"
# Cannot do Integer("1.04"), it will throw an error
puts "#{Integer(1)} is #{Integer(1).class}"
puts "#{Float(str1)} is #{Float(str1).class}"

# From data types to string
# From numbers to string
num = 1.05
puts "#{num} is #{num.class}, and convert to #{num.to_s.class}"
# From array to string
arr = [1,2,4]
puts "#{arr} is #{arr.class} and convert to #{arr.to_s}, which is #{arr.to_s.class}"
# From symbol to string
puts "#{:number} convert to string, becomes: #{:number.to_s}, which is #{:number.to_s.class}"
puts "To convert back to symbol, #{"number".to_sym}"

# From String to Array
str2 = "I am thou and thou art I"
puts "We have #{str2}, which is #{str2.class}"
puts "And we split it become: #{str2.split(" ")}"

# From range to array
ran = 1..10
puts "#{ran} is #{ran.class}, convert to #{ran.to_a}, which is #{ran.to_a.class}"

=begin
Expected Outcome:
This is Lesson 14, we are going over how to convert between data types in Ruby
1.04 is String
1 is Fixnum
1.04 is Float
1 is Fixnum
1.04 is Float
1.05 is Float, and convert to String
[1, 2, 4] is Array and convert to [1, 2, 4], which is String
number convert to string, becomes: number, which is String
To convert back to symbol, number
We have I am thou and thou art I, which is String
And we split it become: ["I", "am", "thou", "and", "thou", "art", "I"]
1..10 is Range, convert to [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], which is Array
This concludes Lesson 14
=end