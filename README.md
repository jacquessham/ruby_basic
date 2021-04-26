# ruby_basic
Repository to store the scripts when I learn Ruby.

## Chapter 1: Very Basic Syntax
This chapter is going to go over the very basic syntax in Ruby.

### Lesson 1: Hello World!
In Ruby, <b>puts</b> is the print statement. Same as <b>print</b> in Python.

### Lesson 2: Declaring a Variable, Comment Blocks and BEGIN and END Statments
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

### Lesson 3: Prints
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

### Lesson 4: Methods
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

### Lesson 6: (Coming Soon...)
