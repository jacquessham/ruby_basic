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
<br><br>
Using <b>'%.2f' % (variable)</b> is one of the ways to round decimals, similar to F-string in Python.

## Supplement 1: Printing Arrays
If you come from a Python background, beware that printing an array with <b>puts arr</b> will print an element on each line without any array syntax. If you wish to print an array with array syntax, you should convert the array to string like below:

```
arr = ["Orange","Apple","Strawberry"]
puts arr.to_s
```

## Files
### printing.rb
The script will first print statement with a string with <b>#{}</b> and compare the string without <b>#{}</b>. Then, it will experiment conducting math within <b>#{}</b> in a string.

### printing_array.rb
The script will print an array when you did not convert the array to string, and print one more time when you have converted the array to string.