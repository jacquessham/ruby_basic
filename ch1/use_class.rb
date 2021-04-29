# Lesson 1.7 Class


# Begin and end statment
BEGIN{puts "This is Lesson 7, we are going over class in Ruby"}
END{puts "This concludes Lesson 7"}

# Define a class (Parent class)
class Student
	# Print this when program read class code clock
	puts "Define a parent class - Student"

	def initialize(student_name, age, gender)
	# Variables
	@student_name = student_name
	@age = age
	@gender = gender

	# Display values once it is declared
	puts "The student name is #{@student_name}, #{@age} years old"
	end

	# Setters
	# Classical way to define
	def set_student_name(student_name)
		@student_name = student_name
	end

	# Ruby Style code
	attr_writer :age

	# Getters
	# Classical way to define
	def get_name
		return @student_name
	end
	# Ruby Style code
	attr_reader :age

	# Accessor (Define both setter and getter at the same time)
	attr_accessor :gender

	# Define super class methods
	def print_age
		puts "This student is #{@age} years old"
	end

	def fruits(apple=0, orange=0)
		puts "This student has #{apple} apples and #{orange} oranges"
	end
end

# Define a child class
class Primary_school_student < Student
	puts "Define a child class - Primary_school_student"

	# Define constructor
	def initialize(student_name, age, gender)
		super
	end

	# Define subclass method
	def fruits(apple,orange)
		# Pass all parameters to super class method
		super
		# Pass only 1 parameter (apple), orange will be use default in super
		super(apple)
		# Not passing any parameter to super
		super()
	end
end

# Define another child class
class Secondary_school_student < Student
	puts "Define a child class - Secondary_school_student"

	# Define constructor
	def initialize(student_name, age, gender)
		super
	end

	def print_age
		puts "This student is #{19-@age} years away to graduate"
	end

end


puts "------------------------------------"
wilson = Primary_school_student.new("Wilson",10, "M")
wilson.print_age
wilson.fruits(1,2)
wilson.set_student_name('Fred')
wilson.age = 12
puts "The new name is #{wilson.get_name} and revised age is #{wilson.age}"
puts "------------------------------------"
acca = Secondary_school_student.new("Acca", 18, "M")
puts "Acca is #{acca.print_age} years old"
puts "------------------------------------"
grace = Student.new("Grace", 17, "M")
puts "The gender of #{grace.get_name} is #{grace.gender}"
grace.gender = "W"
puts "Correction, it is actually #{grace.gender}"

=begin
Expected Output:
This is Lesson 7, we are going over class in Ruby
Define a parent class - Student
Define a child class - Primary_school_student
Define a child class - Secondary_school_student
------------------------------------
The student name is Wilson, 10 years old
This student is 10 years old
This student has 1 apples and 2 oranges
This student has 1 apples and 0 oranges
This student has 0 apples and 0 oranges
The new name is Fred and revised age is 12
------------------------------------
The student name is Acca, 18 years old
This student is 1 years away to graduate
Acca is  years old
------------------------------------
The student name is Grace, 17 years old
The gender of Grace is M
Correction, it is actually W
This concludes Lesson 7
=end
