# Lesson 15: Strings 
File for this lesson: <i>try_string.rb</i>
<br>
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

## Files
The file will declare several string variables to test out the methods listed above, as well as printing french strings.