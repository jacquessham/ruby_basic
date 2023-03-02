## Lesson 7: Class
File for this lesson: <i>use_class.rb</i>
<br>
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
<br><br>
If you wish to set nil as default parameter

```
class <class_name>
	def initialize(<paramenters>=nil) # Constructor
		@<attribute> = <parameters>
	end
end
```

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
<br>
The function <b>super</b> comes with different syntax format:
<ul>
	<li><b>super</b> means passing all parameters to parent method</li>
	<li><b>super(a)</b> means passing only a to parent method</li>
	<li><b>super(a, b)</b> means passing both a and b to parent method</li>
	<li><b>super()</b> means passing nothing to parent method</li>
</ul>
<br>
Also, you may use <b>object.clone()</b> to clone an object:

```
str1 = "Hello World"
str2 = str1.clone
```

### use_class.rb
This file has 1 parent class <b>Student</b>, along with 2 subclasses <b>Primary_school_student</b> and <b>Secondary_school_student</b>. The parent class consists of 3 attributes, <i>student_name</i>, <i>age</i>, and <i>gender</i> along with all setter and getter functions. It has two functions: <i>print_age</i> and <i>fruits</i>. <b>Primary_school_student</b> has a method to override <i>fruits</i> and <b>Secondary_school_student</b> has one to override <i>print_age</i>.
