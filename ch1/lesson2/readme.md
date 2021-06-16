## Lesson 2: Declaring a Variable, Comment Blocks and BEGIN and END Statments

File for this lesson: <i>begin_end.rb</i>
<br><br>
Declaring a variable in Ruby is the same as you do in Python, for example: <b>my_num = 1</b>

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

## File
The file <i>begin_end.rb</i> demostrates how to declare variables and print those on the console. It will first print a statement of the beginning of the lesson. Then, it will declare 2 strings and print it on the console. At the end, print a statement indicating the end of the lesson.
<br><br>
In the rest of the chapter, all scripts will begin with statement of the what lesson is doing, and end with a statement indicating the end of the lesson.