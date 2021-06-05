# Lesson 1.15 Inputs and Outputs

BEGIN{puts "This is Lesson 15, we are going over strings and characters in Ruby"}
END{puts "This concludes Lesson 15"}

# Very basic string methods
my_str = "My first string"
puts "I have declared #{my_str}"
puts "It has #{my_str.length} characters"
puts "It has #{my_str.count("i")} i's"
# When it slice the string, 1st param is first position, 2nd param is how many chars followed
puts "The word with 5 characters starts at position 3 is #{my_str[3,5]}"
# .upcase do not assign, .upcase! reassign the variable
puts my_str.upcase
puts my_str.upcase!
puts my_str

# So do reverse
puts my_str.reverse
puts my_str.reverse!

# Let's try some French word with non-ASCII character
fra_str = "Ren\xc3\xa9 Descartes est philosophe"
puts fra_str
# Non-ASCII characters do not upcase
puts fra_str.upcase

# slicing also accept regex
s = "My Kingdom is a string"
puts "#{s[/.ing/]} or #{s[/str.*/]}"

# Initialize long string, to do so in multiple lines, it auto next line when you enter in different line
# Keyword can be anything
long_str = <<longstr
I will burn my bread.
Babebebebebebe......
longstr
puts long_str

# You may append substring to string
new_long_str = ""
puts "I have started a new variable with nothing: #{new_long_str}"
new_long_str << "I am thou\n"
puts "I added 1 line, now becomes:\n#{new_long_str}"
new_long_str << "Thou art I"
puts "Again another line, now becomes:\n#{new_long_str}"

# Also use join to join elements from an array
data = ['1','2','3']
puts "I can use join function to join elements from an array: #{data.join(' and ')}"

# If you want to include a variable in a long string
arcana = "Chariot"
contract = <<END
I am thou... Thou art I...
Thou hast acquired a new vow...
It shall become the wings of rebellion
That breaketh thy chains of captivity.
With the birth of #{arcana} Persona
I have obtained the winds of blessing that
shall lead to freedom and new power...
END

puts "I have bonded with a chariot social link, I will see:"
puts contract

# Converting character to ASCII code, or by verse
puts "The ASCII code of a is #{"a".ord} and \\n is #{"\n".ord}"
puts "The ASCII code 65 represents #{65.chr}"

# Change case
my_str2 = "Hello world!"
puts my_str2
puts my_str2.upcase
puts my_str2.downcase
puts my_str2.swapcase
puts my_str2.downcase.capitalize

# strip, lstrip or rlstrip in Ruby
my_str3 = "     some text     "
puts my_str3
puts my_str3.lstrip
puts my_str3.rstrip
puts my_str3.strip

# Range of character
chs1 = []
('a'..'e').each{|ch| chs1 << ch}
puts chs1.join(', ') # Range cannot use join

chs2 = []
('aa'..'bb').each{|ch| chs2 << ch}
puts chs2.join(', ')

=begin
Expected Outcome:
I have declared My first string
It has 15 characters
It has 2 i's
The word with 5 characters starts at position 3 is first
MY FIRST STRING
MY FIRST STRING
MY FIRST STRING
GNIRTS TSRIF YM
GNIRTS TSRIF YM
René Descartes est philosophe
RENé DESCARTES EST PHILOSOPHE
King or string
I will burn my bread.
Babebebebebebe......
I have started a new variable with nothing: 
I added 1 line, now becomes:
I am thou
Again another line, now becomes:
I am thou
Thou art I
I can use join function to join elements from an array: 1 and 2 and 3
I have bonded with a chariot social link, I will see:
I am thou... Thou art I...
Thou hast acquired a new vow...
It shall become the wings of rebellion
That breaketh thy chains of captivity.
With the birth of Chariot Persona
I have obtained the winds of blessing that
shall lead to freedom and new power...
The ASCII code of a is 97 and \n is 10
The ASCII code 65 represents A
Hello world!
HELLO WORLD!
hello world!
hELLO WORLD!
Hello world!
     some text     
some text     
     some text
some text
a, b, c, d, e
aa, ab, ac, ad, ae, af, ag, ah, ai, aj, ak, al, am, an, ao, ap, aq, ar, as, at, au, av, aw, ax, ay, az, ba, bb
=end	
