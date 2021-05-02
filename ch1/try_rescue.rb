# Lesson 1.9 Try statement


# Begin and end statment
BEGIN{puts"This is Lesson 9, we are going over try statement in Ruby"}
END{puts"This concludes Lesson 9"}

# Let's try to open an textfile which does not exist, then ask user to enter
# the correct filename, use first_file.txt for example
filename = "goodbyeworld.txt"
begin
	file1 = File.new(filename,"r")

rescue
	puts "File not found, please enter the correct file name:"
	filename = gets.chomp
	file1 = File.new(filename,"r")
ensure
	puts "The loading is done."
end

# And print the lines
file1_arr = IO.readlines(file1)
for line in file1_arr
	puts line
end

=begin
This is Lesson 9, we are going over try statement in Ruby
File not found, please enter the correct file name:
first_file.txt
The operation is done.
Hello World!
Is this the first file you read in Ruby?
This concludes Lesson 9	
=end