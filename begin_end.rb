# Ruby program of BEGIN and END
message1 = 'Hello world!'
message2 = 'We have learnt how to declare a variable and BEGIN and END statement.'
puts message1
puts message2
   
END{
   puts 'This is the end of this script.'
}
BEGIN{
   puts 'Let\'s start the program!'
}

=begin
The expect output is:
Let's start the program!
Hello world
We have learnt how to declare a variable and BEGIN and END statement
This is the end of this script.	
=end