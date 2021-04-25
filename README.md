# ruby_basic
Repository to store the scripts when I learn Ruby.

## Chapter 1: Very Basic Syntax
This chapter is going to go over the very basic syntax in Ruby.

### Lesson 1: Print statement
In Ruby, <b>puts</b> is the print statement. Same as <b>print</b> in Python.

### Lesson 2: Declaring a Variable, Comment Blocks and BEGIN and END Statments
Declaring a variable in Ruby is the same as you do in Python, for example:
```
my_num = 1
```

<br><br>

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
   puts 'End of this script.'
}
BEGIN{
   puts 'Begining of this script'
}
```