# Lesson 10: Files and Folder Management
Files for this lesson: <i>delete.rb</i>.
<br>

To write a text file, use <b>File.new(filename, "w")</b> to create a file object and call <b>.syswrite(# some string)</b> on the file object. To delete a file, simply use <b>File.delete(filename)</b> to delete.
<br>
Examples how to write/read a file:
```
open(filename, "w") do |file|
	file.put("String1")
	file.put("String2")
end

open(filename, "r") do |file|
	file.each{|line| puts line}
end

# Append lines to a file
open(filename, "a") do |file|
	file.put("String3")
	file.put("String4")
end
# now filename has String1, String2, String3, and String4
```
<br>
To check if a file exist, use <b>File.file?()</b>, but it cannot check a directory, socket, or other special file. Or else, you may use <b>File.exists?()</b> to check a directory (But it cannot check a file exist). You may also use <b>File.readable?()</b>, <b>File.writable?()</b>, and <b>File.executable?()</b> to check whether the file is readable, writable, and executable, respectively.
<br><br>
To create a new directory, use <b>Dir.mkdir(directory_name)</b> to do so. If you want to delete the directory, use <b>FileUtils.remove_dir(directory_name)</b> from the <b>fileutils</b> package to do so. It is wise to add <b> if File.directory?(directory_name)</b> after the remove directory function because it will throw an error if there is no existing directory.

## Files
During the lesson, you would received a text file <i>no_use.txt</i> and a directory <i>Testing</i>. But both the file and the directory will be deleted before the script ends.
<br>
Packages required: <b>fileutils</b>
<br><br>
The script first create a file, and delete immediately afterward. Then, it will create a folder, and delete immediately afterward.
