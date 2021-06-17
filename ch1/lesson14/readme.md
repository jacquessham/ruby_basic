# Lesson 14: Data Type Convertion
File for this lesson: <i>conversion.rb</i>
<br>
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

## Files
<i>conversion.rb</i> is a straight-forward script. There are 3 major blocks of code. The 1st block is to have a string of <i>1.04</i> to convert to either integer or float. The 2nd block is to have a float number and an array convert to string. The 3rd block is to have a string and a range object to split/convert to an array.