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
puts "--------------------------------------------"

# Try read first_file.txt
puts "Now Try to read a file."
file1_name = "first_file.txt"
file1 = File.new(file1_name,"r")

if file1 then
	# sysread will read the first 13 characters
	read_num = 13
	content = file1.sysread(read_num)
	puts "We will read the first #{read_num} characters"
	puts content
else
	puts "Not able to load #{file1_name}"
end

# Now Read all lines
if file1 then
	puts "Now read all lines of the file"
	file1_arr = IO.readlines(file1_name)
	for line in file1_arr do 
		puts "#{line}"	
	end
else	
	puts "Not able to load #{file1_name}"
end
puts "--------------------------------------------"

# Now save a text file with a number on each line
puts "Let's save a file with 0-9 on each line"
file2_name = "second_line.txt"
file2 = File.new(file2_name,"w")
if file2 then
	for i in 0..9 do 
		file2.syswrite("#{i}\n")
	end
	puts "File saved!"
else
	puts "Not able to save the file"
end

puts "--------------------------------------------"

# Let's check the file again
puts "Now re-open the file we saved"
file3_name = file2_name
file3 = File.new(file3_name,"r")
if file1 then
	puts "Now read all lines of the file we saved"
	file3_arr = IO.readlines(file3_name)
	for line in file3_arr do 
		puts "#{line}"	
	end
else	
	puts "Not able to load #{file1_name}"
end

=begin
This is Lesson 8, we are going inputs and outputs in Ruby
Please enter your name:
<Input>
Please neter your age:
<Input>
<Input> is <Input> years old
--------------------------------------------
Now Try to read a file.
We will read the first 13 characters
Hello World!
Now read all lines of the file
Hello World!
Is this the first file you read in Ruby?
--------------------------------------------
Let's save a file with 0-9 on each line
File saved!
--------------------------------------------
Now re-open the file we saved
Now read all lines of the file we saved
0
1
2
3
4
5
6
7
8
9
This concludes Lesson 8
=end