# Lesson 8: Inputs and Outputs
Files for this lesson: <i>gets.rb</i> and <i>first_file.txt</i>.
<br>
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
<br>
In write mode: <b>filename.syswrite()</b> writes string in filename.
<br>
List of mode:
<ul>
	<li><b>r</b>: Read only</li>
	<li><b>w</b>: Write, overwrite if exist a file</li>
	<li><b>a</b>: Append to a file, if not exist, create a new file and write</li>
</ul>

## Files
In the first section, the script first read first 13 characters in <i>first_file.txt</i>. Then, it will save a file <i>second_file.txt</i> writing 0-9 in each line in the file. Then, it will read <i>second_file.txt</i> and print the lines on the console.
