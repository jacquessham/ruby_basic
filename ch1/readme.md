# Chapter 1: Very Basic Syntax


### Lesson 1: Hello World!
File for this lesson: <i>helloworld.rb</i>
<br><br>
In Ruby, <b>puts</b> is the print statement. Same as <b>print</b> in Python.


### Lesson 2: Declaring a Variable, Comment Blocks and BEGIN and END Statments
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

### Lesson 3: Print
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

### Lesson 4: Method
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

### Lesson 5: Loops & If-else Statement
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

#### While Loop
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

#### For Loop
```
for n in 0..10 do
	# Do something
end

arr = ['a','b','c']
for ch in arr do
	# Do something
end
```

#### Do..while Loop
```
loop do
	# Do something
	break if # Something
end
```

#### Until Loop
```
num = 0
until num == 5 do
	puts num+1
	num += 1
end
```

Note: In the above, it will print 0,1,2,3,4

#### If-else Statement
```
if (condition) then (statement)
elsif (condition) then(statement)
else (statement)
end
```

#### Case Statement
```
case
	when (condition) then (statement)
	when (condition) then (statement)
	else (statement)
end
```

### Lesson 6: Array
File for this lesson: <i>use_array.rb</i>
<br><br>
#### Declaring an Array
These are the style of syntax to declare arrays in Ruby. Arrays are 0-based and do not have a fixed size like Java.
<ul>
	<li>Python style: arr = [1,2,3]</li>
	<li>Java style: arr2 = Array.new(n) <- Create nil n times</li>
</ul>

#### Selecting/AddingEditing elements
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

#### Array Functions
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

### Lesson 7: Class
File for this lesson: <i></i>
<br><br>
(Coming Soon...)

### Lesson 8: (Coming Soon...)
