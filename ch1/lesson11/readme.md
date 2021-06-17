# Lesson 11: Try statement
Files for this lesson: <i>try_rescue.rb</i> and <i>first_file.txt</i>
<br>
```
begin  # Same as try in Python/Java
    # Do something
    raise Exception # Or raise "Message"
rescue # Same as except in Python/ catch in Java
    # Do something, occurs when an error occur
ensure # Execute regardless an error occur
    # Do something
end 
```

If you want to try an error when user enter a wrong data type, you may add <b>rescue</b> after the user input function like below:

```
user_input = Integer(gets.chomp) rescue # Do something when an error occur
```

## File
The script will try to read a file and get an input from user. When reading the file, the code will be purposefully failed and ask user to input the correct file path, follow the instruction and enter the correct file path. When the program ask user to enter an integer, you may enter an integer or anything that is not a positive integer. If you do not enter a positive integer, the catch statement will detect and print the message of notifying the input is invalid.