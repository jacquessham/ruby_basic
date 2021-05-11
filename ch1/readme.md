# Chapter 1: Very Basic Syntax


## Lesson 1: Hello World!
File for this lesson: <i>helloworld.rb</i>
<br><br>
In Ruby, <b>puts</b> is the print statement. Same as <b>print</b> in Python.


## Lesson 2: Declaring a Variable, Comment Blocks and BEGIN and END Statments
File for this lesson: <i>begin_end.rb</i>
<br><br>
Declaring a variable in Ruby is the same as you do in Python, for example:
```
my_num = 1
```

<br><br>

Comment Blocks in Ruby is similar to the one in Python: Use # in the begining of the comment. However, the multi-lines comment block is different: Use <b>=begin</b> and <b>=end</b>. For example:
```
# This is a comment line

=begin
This is a comment block
=end
```

<br><br>
BEGIN and END statements are statements that have the program to do either in the begining or the end of the program, regardless where you place the statement in the script. The syntax starts with either <b>BEGIN</b> or <b>END</b> and followed by <b>{}</b>, which stores the commands like Java. For example:
```
END{
   puts "End of this script.""
}
BEGIN{
   puts "Begining of this script"
}
```

## Lesson 3: Print
File for this lesson: <i>printing.rb</i>
<br><br>
<b>puts</b> is a printing function in Ruby, the same as <b>print()</b> in Python or <b>System.out.println()</b> in Java. <b>print</b> also prints in Ruby but it does not skip to next line after <b>print</b> is executed. In Ruby, there is no need to wrap the string with () for the printing strings. To print a variable in a string or a math calculating, wrap the variable or math calculation with <b>#{}</b>. For example:

```
put "To print a string"
print "To print a string without skipping a line"

# To print variable or math calculation in a string
apple = 3
puts "There are #{apple} apples"
# It will print: There are 3 apples

puts "1 + 1 equals to #{1+1}."
# It will print: 1 + 1 equals to 2.
```

<br><br>
Note that <b>#{}</b> only works in a string with double quotation, it will not calculate anything or pass any variable if <b>#{}</b> is put into a string with single quotation.

## Lesson 4: Method
File for this lesson: <i>use_methods.rb</i>
<br><br>
Functions are called <b>Methods</b> in Ruby. The syntax starts by <b>def</b> and end with <b>end</b>, like below:

```
# Method with no parameter
def method_no_para
puts "This method has no parameter"
end

# Method with 1 parameter
def method_1para(var1)
puts var1
end

# Method with 2+ parameters, with default values
def method_2para(var1=1, var2=2)
puts "We have received #{var1} and #{var2}"
end

# Method to return object
def method_return
return 1
end

# Method to return more than 1 object
def method_2returns
i = 1
j = 2
return i,j
end
```

## Lesson 5: Loops & If-else Statement
File for this lesson: <i>loops.rb</i>
<br><br>
There are 4 kinds of loops in Ruby:
<ul>
	<li>While Loop</li>
	<li>For Loop</li>
	<li>Do..while Loop</li>
	<li>Until Loop</li>
</ul>

<br><br>
And will also going over the following function:
<ul>
	<li>If-else Statement</li>
	<li>Case Statement</li>
</ul>

### While Loop
```
curr = 0
while curr < 6 do
	# Do something
	curr += 1
end

while true do
	# Do something
	curr += 1
	break if curr > 10
end
```

### For Loop
```
for n in 0..10 do
	# Do something
end

arr = ['a','b','c']
for ch in arr do
	# Do something
end
```

### Do..while Loop
```
loop do
	# Do something
	break if # Something
end
```

### Until Loop
```
num = 0
until num == 5 do
	puts num+1
	num += 1
end
```

Note: In the above, it will print 0,1,2,3,4

### If-else Statement
```
if (condition) then (statement)
elsif (condition) then(statement)
else (statement)
end
```

### Case Statement
```
case
	when (condition) then (statement)
	when (condition) then (statement)
	else (statement)
end
```

## Lesson 6: Array
File for this lesson: <i>use_array.rb</i>
<br><br>
### Declaring an Array
These are the style of syntax to declare arrays in Ruby. Arrays are 0-based and do not have a fixed size like Java.
<ul>
	<li>Python style: arr = [1,2,3]</li>
	<li>Java style: arr2 = Array.new(n) <- Create nil n times</li>
</ul>

### Selecting/AddingEditing elements
There are a couple ways to select element(s) in an array:
<ul>
	<li>arr[0] - Select 1 element at position 0 of arr</li>
	<li>arr[0..2] - Selecting position 0,1,2 in the arr, positions are inclusive</li>
	<li>arr[-1] - select last element in arr</li>
</ul>

<br><br>
To add an element in an array, simply:
```
arr << 1
```

<br>
It will add 1 to the end to arr

<br><br>
Or to edit an element in an array, declare the new value to the array and its position, for example:
```
arr[0] = "apple"
```

### Array Functions
<ol>
	<li>There are 2 ways to obtain the size of an array, use the functions: <i>.length</i> and <i>.size</i>.</li>
	<li>arr1 + arr2 - Append the elements in arr2 to the end of arr1</li>
	<li>arr1 - arr2 - If the elements in arr2 appears in elements, those elements will be taken away</li>
	<li>arr * 3 - The elements in arr will be repeated 2 more times (*3 means the time of all elements appears 1*3 times) </li>
	<li>Intersection - See code below the list</li>
	<li>arr.sort - Sort arr from low to high</li>
	<li>arr.compact - Delete nil's in arr</li>
	<li>arr.transpose - Transpose the array elements (Used for martrix in linear algebra)</li>
</ol>

```
1. arr.length/ arr.size
2. arr1 + arr2
3. arr1 - arr2
4. arr*3
5. arr1 & arr2
6. arr.sort
7. arr.compact
8. arr.transpose
```

## Lesson 7: Class
File for this lesson: <i>use_class.rb</i>
<br><br>
This is how a class is defined:
```
class <class_name>
	def initialize(<paramenters>) # Constructor
		@<attribute> = <parameters>
	end

	# Setter + Getter
	attr_accessor :<attribute>

	# Class method
	def method_name(<parameters>)
		# Do something
	end
end
```

<br><br>
Note: class attribute starts with <b>@</b> followed by attribute name
<br>
There are 3 ways to for setter/getter:
<ul>
	<li>Regular class method</li>
	<li>attr_writer (For setter)/attr_reader (For getter)</li>
	<li>attr_accessor (Syntax of setter and getter in one)</li>
</ul>

<br>

This is how a subclass is defined:
```
class <subclass_name> < <class_name>
	def initialize(<parameters>)
		super # Pass all parameters to parent class method
	end

	def Class method # If subclass has a method with the same name, override parent class method
		# Do something else
	end

end
```

<br><br>
The function <b>super</b> comes with different syntax format:
<ul>
	<li><b>super</b> means passing all parameters to parent method</li>
	<li><b>super(a)</b> means passing only a to parent method</li>
	<li><b>super(a, b)</b> means passing both a and b to parent method</li>
	<li><b>super()</b> means passing nothing to parent method</li>
</ul>

### use_class.rb
This file has 1 parent class <b>Student</b>, along with 2 subclasses <b>Primary_school_student</b> and <b>Secondary_school_student</b>. The parent class consists of 3 attributes, <i>student_name</i>, <i>age</i>, and <i>gender</i> along with all setter and getter functions. It has two functions: <i>print_age</i> and <i>fruits</i>. <b>Primary_school_student</b> has a method to override <i>fruits</i> and <b>Secondary_school_student</b> has one to override <i>print_age</i>.

## Lesson 8: Inputs and Outputs
Files for this lesson: <i>gets.rb</i> and <i>first_file.txt</i>.<br>
In the end of the lesson, you will receive <i>second_file.txt</i>.
<br><br>
Here is the code to ask users for input:
```
puts "Ask user for input"
user_input = gets.chomp
```

<br>
Use <b>gets</b> to receive input from users, <b>chomp</b> removes all separtors.
<br><br>
To open to read/write a file: <b>File.new(filename, mode)</b>
<br>
In read mode: <b>filename.sysread(n)</b> reads the first <b>n</b> characters in the file filename. <b>IO.readlines(filename)</b> reads all lines in filename and store all lines in string in an array. 
<br><br>
In write mode: <b>filename.syswrite()</b> writes string in filename.

## Lesson 9: Loading data (CSV, JSON)
Files for this lesson: <i>gets_v2.rb</i>.<br>
In the end of the lesson, you will receive <i>numbers.csv</i> and <i>numbers.json</i>.
<br><br>
Packages required:
<ul>
	<li>csv</li>
	<li>json</li>
</ul>
<br><br>
(Coming Soon...)

## Lesson 10: Files and Folder Management
Files for this lesson: <i>delete.rb</i>.<br>
During the lesson, you will received...(Coming Soon...)
<br><br>
Packages required:
<ul>
	<li>fileutils</li>
</ul>
<br><br>
(Coming Soon...)

## Lesson 11: Try statement
Files for this lesson: <i>try_rescue.rb</i> and <i>first_file.txt</i>

```
begin  # Same as try in Python/Java
    # Do something
    raise Exception # Or raise "Message"
rescue # Same as except in Python/ catch in Java
    # Do something, occurs when an error occur
ensure # Execute regardless an error occur
    # Do something
end 
```

## Lesson 12: Hash
Hash is the Ruby version of dictionary in Python. File for this lesson: <i>try_hash.rb</i>
<br>
<br>
```
# Declare new empty hash
mydict = Hash.new

# Hard code new hash with keys and value
mydict = Hash["k1" => 1, "k2" => 2]

# Add new key and values into hash
mydict.store("k3", 3)
# Or
mydict["k3"] = 3

# Obtain keys in array from hash
keys_arr = mydict.keys

# Obtain value of k1 from hash
v1 = mydict['k1']
```

## Lesson 13: (Coming Soon...)
