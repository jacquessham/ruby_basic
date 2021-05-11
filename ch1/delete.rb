# Lesson 1.10 Files and Folder Management
require 'fileutils'

# Begin and end statment
BEGIN{puts"This is Lesson 10, we are going over Files and Folder Management in Ruby"}
END{puts"This concludes Lesson 10"}

# First write a file
file = File.new("no_use.txt","w")
file.syswrite("I am about to be deleted")
puts "Text file saved..."
# Now delete it
File.delete("no_use.txt") if File.exist?("no_use.txt")
puts "Text file deleted"

# Then make a directory
puts "Now make a new directory called 'Testing'"
Dir.mkdir("Testing") if !File.directory?("Testing")
FileUtils.remove_dir("Testing") if File.directory?("Testing")
puts "New directory deleted"