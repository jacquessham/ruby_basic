# Chapter 1: Very Basic Syntax

## Lesson 1: Hello World!
File for this lesson: <i>helloworld.rb</i>
<br>
It can be found in the <a href="https://github.com/jacquessham/ruby_basic/tree/main/ch1/lesson1">Lesson 1 Folder</a>.
<br><br>
In Ruby, <b>puts</b> is the print statement. Same as <b>print</b> in Python. To print statement without next line, you may use <b>print </b>.
<br><br>
To execute your ruby script, simply run <b>ruby some_script.rb</b> in your command line. <i>Gemfile.lock</i> allows you to specify which gems to use in your scripts. In order to execute your script with your gemfiles, execute <b>bundle exec ruby <i>some_script.rb</i></b> in your command line. 
<br><br>
To import a package(gem) or another script, use the keyword <b>require</b> or <b>require_relative</b> to do so.

## Lesson 2: Declaring a Variable, Comment Blocks and BEGIN and END Statments
File for this lesson: <i>begin_end.rb</i>
<br>
It can be found in the <a href="https://github.com/jacquessham/ruby_basic/tree/main/ch1/lesson2">Lesson 2 Folder</a>.
<br><br>
Declaring a variable in Ruby is the same as you do in Python, for example: <b>my_num = 1</b>
<br>
Use <b>=begin</b> and <b>=end</b> to comment a block of string, and <b>BEGIN</b> and <b>END</b> followed by <b>{}</b> to make the script to run these blocks of code in the beginning and at the end of the script, respectively.

## Lesson 3: Print
File for this lesson: <i>printing.rb</i>
<br>
It can be found in the <a href="https://github.com/jacquessham/ruby_basic/tree/main/ch1/lesson3">Lesson 3 Folder</a>.
<br><br>
<b>puts</b> is a printing function in Ruby, the same as <b>print()</b> in Python or <b>System.out.println()</b> in Java. <b>print</b> also prints in Ruby but it does not skip to next line after <b>print</b> is executed. In Ruby, there is no need to wrap the string with () for the printing strings. To print a variable in a string or a math calculating, wrap the variable or math calculation with <b>#{}</b>. 
<br><br>
Using <b>'%.2f' % (variable)</b> is one of the ways to round decimals, similar to F-string in Python.

## Lesson 4: Method
File for this lesson: <i>use_methods.rb</i>
<br>
It can be found in the <a href="https://github.com/jacquessham/ruby_basic/tree/main/ch1/lesson4">Lesson 4 Folder</a>.
<br><br>
A method begins with a keyword <b>def</b> like Python, following by method name, code block, and end with a keyword <b>end</b>. An example is the following:

```
# Method with 1 parameter
def method_1para(var1)
puts var1
end
```

Note: You may not restrict the parameter data type. Alternatively, you would have to examine the data type within the method and handle the type inconsistency.

## Lesson 5: Loops & If-else Statement
File for this lesson: <i>loops.rb</i>
<br>
It can be found in the <a href="https://github.com/jacquessham/ruby_basic/tree/main/ch1/lesson5">Lesson 5 Folder</a>.
<br><br>
There are 4 kinds of loops in Ruby:
<ul>
	<li>While Loop</li>
	<li>For Loop</li>
	<li>Do..while Loop</li>
	<li>Until Loop</li>
	<li>Loop..do Loop</li>
</ul>

<br><br>
And will also going over in the lesson folder for the following function:
<ul>
	<li>If-else Statement</li>
	<li>Case Statement</li>
</ul>
<br><br>
Use && and || to represent "and" and "or" logic.


## Lesson 6: Array
File for this lesson: <i>use_array.rb</i>
<br>
It can be found in the <a href="https://github.com/jacquessham/ruby_basic/tree/main/ch1/lesson6">Lesson 6 Folder</a>.
<br><br>
These are the style of syntax to declare arrays in Ruby. Arrays are 0-based and do not have a fixed size like Java.
<br>
<ul>
	<li>Python style: arr = [1,2,3]</li>
	<li>Java style: arr2 = Array.new(n) <- Create nil n times</li>
	<li>Special way to build an array of strings: arr3 = %w{Mon Tues Fri Sun}</li>
</ul>
There are a couple ways to select element(s) in an array:
<ul>
	<li>arr[0] - Select 1 element at position 0 of arr</li>
	<li>arr[0..2] - Selecting position 0,1,2 in the arr, positions are inclusive</li>
	<li>arr[-1] - select last element in arr</li>
</ul>

<br><br>
To add an element in an array, simply use: <b>arr << 1</b>
<br>
It will add 1 to the end to arr
<br><br>
Or to edit an element in an array, declare the new value to the array and its position, for example:
<b>arr[0] = "apple"</b>
<br><br>
Array in Ruby is mutable like Java. If you wish to copy an array, you should use <b>.clone()</b> to make a copy.
<br><br>
You may use 0..5 to declare a range.
<br><br>
\*\*Note: Range in Ruby is inclusive

See the <a href="https://github.com/jacquessham/ruby_basic/tree/main/ch1/lesson6">Lesson 6 Folder</a> for more functionality about array.

## Lesson 7: Class
File for this lesson: <i>use_class.rb</i>
<br>
The detail be found in the <a href="https://github.com/jacquessham/ruby_basic/tree/main/ch1/lesson7">Lesson 7 Folder</a>.

## Lesson 8: Inputs and Outputs
Files for this lesson: <i>gets.rb</i> and <i>first_file.txt</i>.<br>
In the end of the lesson, you will receive <i>second_file.txt</i>.
<br>
It can be found in the <a href="https://github.com/jacquessham/ruby_basic/tree/main/ch1/lesson8">Lesson 8 Folder</a>.
<br><br>
Use <b>gets</b> to receive input from users, <b>chomp</b> removes all separtors.
<br>
In read mode: <b>filename.sysread(n)</b> reads the first <b>n</b> characters in the file filename. <b>IO.readlines(filename)</b> reads all lines in filename and store all lines in string in an array. 
<br>
In write mode: <b>filename.syswrite()</b> writes string in filename.

## Lesson 9: Loading and Saving Data for Specific Format (CSV, JSON)
Files for this lesson: <i>gets_v2.rb</i>.<br>
In the end of the lesson, you will receive <i>numbers.csv</i> and <i>numbers.json</i>.
<br>
It can be found in the <a href="https://github.com/jacquessham/ruby_basic/tree/main/ch1/lesson9">Lesson 9 Folder</a>.
<br><br>
To do so, the gems <b>CSV</b> and <b>JSON</b>. Use <b>csv.read(filename)</b> to read csv lines and convert to an array. Likewise, use <b>File.read()</b> all string in a JSON file and use <b>JSON.parse()</b> to parse the string to a hash. Find more detail, like how to save CSV or JSON files in the <a href="https://github.com/jacquessham/ruby_basic/tree/main/ch1/lesson9">Lesson 9 Folder</a>.

## Lesson 10: Files and Folder Management
Files for this lesson: <i>delete.rb</i>.
<br>
It can be found in the <a href="https://github.com/jacquessham/ruby_basic/tree/main/ch1/lesson10">Lesson 10 Folder</a>.
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
<br>
It can be found in the <a href="https://github.com/jacquessham/ruby_basic/tree/main/ch1/lesson11">Lesson 11 Folder</a>.
<br><br>
The try statement keywords are <b>begin</b> to try an code block, <b>rescue</b> to handle an error, and <b>ensure</b> to run regardless any error was threw. <b>rescue</b> may also use to handle if data convertion failed.


## Lesson 12: Hash
Hash is the Ruby version of dictionary in Python. File for this lesson: <i>try_hash.rb</i>
<br>
It can be found in the <a href="https://github.com/jacquessham/ruby_basic/tree/main/ch1/lesson12">Lesson 12 Folder</a>.
<br><br>
Hash may be declare with <b>Hash.new</b> or <b>{}</b>, it is also the same structure with JSON format.

## Lesson 13: Random
File for this lesson: <i>try_random.rb</i>
<br>
It can be found in the <a href="https://github.com/jacquessham/ruby_basic/tree/main/ch1/lesson13">Lesson 13 Folder</a>.
<br><br>
Random is a standard gem in Ruby and used to randomly generate integers or a float number. Use <b>rand</b> to generate a float number between 0 and 1. To generate an integer between a and b, use <b>rand(a..b)</b>, note that you should put a range betwen a and b, not a comma b. If you have an array, you may call a method on the array with <b>.sample</b> to randomly pick an element from the array, or use <b>.sample(n)</b> to pick n elements from the array.

## Lesson 14: Data Type Convertion
File for this lesson: <i>conversion.rb</i>
<br>
It can be found in the <a href="https://github.com/jacquessham/ruby_basic/tree/main/ch1/lesson14">Lesson 14 Folder</a>.
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
<br>
It can be found in the <a href="https://github.com/jacquessham/ruby_basic/tree/main/ch1/lesson15">Lesson 15 Folder</a>.
<br><br>
There are several common string methods, but more methods may be found in the folder:
<ul>
	<li>length</li>
	<li>upcase/upcase!</li>
	<li>downcase</li>
	<li>swapcase</li>
	<li>capitalize</li>
	<li>strip</li>
	<li>lstrip</li>
	<li>rstrip</li>
	<li>split("substring")</li>
	<li>join("substring")</li>
</ul>


## Lesson 16: Date/Time
File for this lesson: <i>datetime.rb</i>
<br>
It can be found in the <a href="https://github.com/jacquessham/ruby_basic/tree/main/ch1/lesson16">Lesson 16 Folder</a>.
<br><br>
Useful standard package:
<ul>
	<li>Time</li>
	<li>Date</li>
</ul>
<br>
Time in Ruby is the Unix epoch, time zero is at 1st of January, 1970 midnight. To access this, use <b>Time.at(0)</b> where 0 is the epoch. In Datetime, use <b>strptime(time_string, time_string_format)</b> to convert string to datetime object. 


## Lesson 17: Numbers and Math
File for this lesson: <i>num.rb</i>
<br>
It can be found in the <a href="https://github.com/jacquessham/ruby_basic/tree/main/ch1/lesson17">Lesson 17 Folder</a>.
<br><br>
Useful standard package:
<ul>
	<li>math</li>
	<li>mathn</li>
	<li>prime</li>
	<li>rational</li>
</ul>
<br>
math is a standard library to support any kind of mathematically expression, including squart root, natural log...etc. mathn is a newer version, but rely on math, to handle more flexible situations, like return an integer when square rooting an integer (It is not supported in math). Matrices is supported under mathn. To check whether a integer is a prime number, use the Prime gem, its instances contains the prime numbers. Use <b>prime?</b> to check whether the number is a prime number.

