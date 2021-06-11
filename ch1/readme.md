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

<br><br>
If you use <b>break</b> in the method, the method will stop immediately.

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

### Iteration Switch
Ruby also break the loop or skip an iteration. To skip an iteration, use <b>next</b>, the loop will process to the next ieteration immediately. This is the same as <i>continue</i> in Python. Use <b>break</b> to end the loop immediately, the loop will no longer iterating. <b>break</b> can also used in methods, if so, the method will stop immediately.

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

### Lazy method
If you call <b>.lazy</b> method to array or hash, then it will become a <i>Enumerator</i> class and will not calculate until a method is called to the array object

```
arr = [1,2,3].lazy.map{|num| num**2}
# arr will become an enumerator object

arr = arr.to_a
# then arr becomes [1,4,9]
```

This new method does not have an obvious benefit until the data set is large, it will prevent using unnecessary amount of memory in temporary variables.

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

	# If subclass has a method with the same name, override parent class method
	def method1
		# Do something else
	end

	# If we have private before def, it become private method
	private def method2
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
<br><br>
List of mode:
<ul>
	<li><b>r</b>: Read only</li>
	<li><b>w</b>: Write, overwrite if exist a file</li>
	<li><b>a</b>: Append to a file, if not exist, create a new file and write</li>
</ul>

## Lesson 9: Loading and Saving Data for Specific Format (CSV, JSON)
Files for this lesson: <i>gets_v2.rb</i>.<br>
In the end of the lesson, you will receive <i>numbers.csv</i> and <i>numbers.json</i>.
<br><br>
Packages required:
<ul>
	<li>csv</li>
	<li>json</li>
</ul>
<br><br>

### CSV
To read/write a csv file, in vanilla version, use <b>csv</b> gem. <b>CSV.read(filename)</b> will return a 2-D array of data from the csv file you read. To write a csv file, first prepare your data in arrays: Each array represent a row. Then, write the file with following code:

```
CSV.open(filename,"w") do |csv_file|
	for i in # Some 2-D array
		csv_file << i # i is an array with a 2-D array
	end # End for loop
end # Close csv

```

Each loop iteration will add a row to csv_file, and return csv_file to save in a physical CSV file.
<br><br>
Beside a physical CSV file, csv gem can also able to parse a csv style string, simply prepare a string with csv style parse it with <b>CSV.parse(# some string)</b> and it will return an 2-D array

### JSON
To read/write a json file, in vanilla version, use <b>json</b> gem. To read a JSON file, use <b>File.read(filename)</b> to declare a file object first. Then, parse the object with <b>JSON.parse(# file object)</b> and it will return a hash. To write a JSON file, first prepare the hash with data, then use <b>File.write(filename, JSON.dump(# some hash))</b> and it will generate a physical JSON file. If you want the JSON file indented properly, use <b>pretty_generate(# some hash)</b> to convert the string. The below code block demostrate how to write and read a JSON file:

```
# To write a JSON file, nums is a hash previous prepared
File.write("numbers.json", JSON.dump(nums))
# Or write the JSON file intented
File.write("numbers_pretty.json", pretty_generate(nums))

# To read numbers and parse it to a hash
json_file = File.read("numbers.json")
nums_dict = JSON.parse(json_file)

````

## Lesson 10: Files and Folder Management
Files for this lesson: <i>delete.rb</i>.
<br>
During the lesson, you would received a text file <i>no_use.txt</i> and a directory <i>Testing</i>. But both the file and the directory will be deleted before the script ends.
<br><br>
Packages required: <b>fileutils</b>
<br><br>
To write a text file, use <b>File.new(filename, "w")</b> to create a file object and call <b>.syswrite(# some string)</b> on the file object. To delete a file, simply use <b>File.delete(filename)</b> to delete.
<br><br>
To create a new directory, use <b>Dir.mkdir(directory_name)</b> to do so. If you want to delete the directory, use <b>FileUtils.remove_dir(directory_name)</b> from the <b>fileutils</b> package to do so. It is wise to add <b> if File.directory?(directory_name)</b> after the remove directory function because it will throw an error if there is no existing directory.

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

If you want to try an error when user enter a wrong data type, you may add <b>rescue</b> after the user input function like below:

```
user_input = Integer(gets.chomp) rescue # Do something when an error occur
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
## Lesson 13: Random
File for this lesson: <i>try_random.rb</i>
<br><br>
Random is a standard gem in Ruby and used to randomly generate integers or a float number. Use <b>rand</b> to generate a float number between 0 and 1. To generate an integer between a and b, use <b>rand(a..b)</b>, note that you should put a range betwen a and b, not a comma b. If you have an array, you may call a method on the array with <b>.sample</b> to randomly pick an element from the array, or use <b>.sample(n)</b> to pick n elements from the array.

## Lesson 14: Data Type Convertion
File for this lesson: <i>conversion.rb</i>
<br><br>
Below is the list to convert between data types:
<ul>
	<li>to_i: Convert string/float to integer</li>
	<li>to_f: Convert string/integer to float</li>
	<li>to_a: Convert range to array</li>
	<li>Integer(string): Convert an integer string to integer, note that float string does not work, ie, Integer("1.04") will throw an error, only Integer("1") works</li>
	<li>Float(string): Convert a float string to float</li>
	<li>to_sym: Convert string to symbol</li>
	<li>to_s: Convert integer/float/array/symbol to string</li>

</ul>

## Lesson 15: Strings 
File for this lesson: <i>try_string.rb</i>
Simply assign a string by variable equal string wrapped with quotation. Here are some useful string method:
<ul>
	<li>slice(pos,range): Extract a substring, starting at position <i>pos</i> until following <i>range</i> characters, str[pos,range] is the same as str.slice(pos,range). Alternatively, str[regex] also works, pos also works with a negative number (-1 means last character in the string)</li>
	<li>count("substring"): Count the frequency of substring</li>
	<li>length: Number of characters in this string</li>
	<li>upcase: Convert all characters into uppercase</li>
	<li>upcase!: Convert all characters into uppercase, and reassign to the variable</li>
	<li>downcase: Convert all characters into lowercase, ! available to reassign variable</li>
	<li>swapcase: Convert all characters to opposite case, ! available to reassign variable</li>
	<li>capitalize: Convert the first letter to uppercase, ! available to reassign variable</li>
	<li>strip: Remove begining and ending whitespace</li>
	<li>lstrip: Remove begining whitespace</li>
	<li>rstrip: Remove ending whitespace</li>
	<li>ord: Convert character to ASCII code</li>
	<li>chr(Use for number): Convert a number from ASCII code to character</li>
	<li>reverse: Reverse the order of characters in the string, ! available to reassign variable</li>
	<li>split("substring"): Split a string into array, separate by substring</li>
	<li>join("substring")(Use for array): Join all elements in an array to a string, each element is join by substring</li>
</ul>

<br><br>
If you have a long string, you may use below code:
```
str << keyword
Any string
Next line in the script automatically apply next line without enter \n
keyword
```
Note that keyword can be anything, as long as you have included another keyword to place an identify the end of string

<br><br>
Alphabetically increasing strings can also be iterated in a proper pattern in range,<b>('aa'..'bb')</b> will be creating a range from <i>aa</i>, <i>ab</i>, <i>ac</i> ... <i>az</i>, <i>ba</i>, <i>bb</i>.


## Lesson 16: Date/Time (Coming Soon..)
Reference: <a href="https://www.rubyguides.com/2015/12/ruby-time/">here</a>

## Lesson 17: Numbers,Math & Statistics(Under Construction...)
File for this lesson: <i>num.rb</i>
<br><br>
Useful standard package:
<ul>
	<li>math</li>
	<li>mathn</li>
	<li>prime</li>
	<li>cmath</li>
</ul>
<br>
math is a standard library to support any kind of mathematically expression, including squart root, natural log...etc. mathn is a newer version, but rely on math, to handle more flexible situations, like return an integer when square rooting an integer (It is not supported in math). Matrices is supported under mathn. To check whether a integer is a prime number, use the Prime gem, its instances contains the prime numbers. Use <b>prime?</b> to check whether the number is a prime number.