# Lesson 1.5 Loops & If-else Statement

# Begin and end statment
BEGIN{puts"This is Lesson 5, we are going over Loops and "+
	      "If-else Statement in Ruby"}
END{puts"This concludes Lesson 5"}

# While Loops
puts "We are executing a while loop. We are printing numbers between 0-5"
curr = 0
while curr < 6 do
	puts curr
	curr += 1
end

puts "------------------------------------"

print "Here is a while loop using a break function. We are printing numbers "
puts "between 6-10"
while true do
	puts curr
	curr += 1
	break if curr > 10
end
puts "------------------------------------"

print "Here is a while loop using a next function. We are printing odd " 
puts "numbers between 1-10"
x = 0
while true do
	x += 1
	if x > 10 then break
	elsif x%2==0 then next
	end
	puts x
end
puts "------------------------------------"

# For loops
print "Now let's go over for loops."
puts " We are looking for even numbers between 0-10"
for n in 0..10 do
	if n%2 == 0 then puts "#{n} is a even number."
	else puts "#{n} is a odd number."
	end
end
puts "------------------------------------"

puts "Now let's print all elements in an array."
arr = ['a','b','c','d']
for ch in arr do
	puts ch
end
puts "------------------------------------"

# Do..while loop
puts "Next we are doing a do..while loop and print even numbers between 11-20"
curr = 10
loop do
	unless curr%2==0 then puts curr
	end
	curr += 1
	break if curr > 20
end
puts "------------------------------------"

# Until Loop
num = 19
print "The last loop we are going over Until Loop "
puts "and print numbers between 20-25"
until num == 25 do
	puts num+1
	num += 1
end

# Case Statement
# Case Statement
def num_case(num)
	case 
		when num%2 == 0 then puts "#{num} is even number"
			 num += 1
		else puts "#{num} is odd number"; num += 1
	end
return num
end

num = 90
print "Lastly, let's use Case Statement to find odd and even numbers between "
puts "90-100"
loop do
num = num_case(num)
break if num > 100
end

=begin
The expected outcome:
This is Lesson 5, we are going over Loops and If-else Statement in Ruby
We are executing a while loop. We are printing numbers between 0-5
0
1
2
3
4
5
------------------------------------
Here is a while loop using a break function. We are printing numbers between 6-10
6
7
8
9
10
------------------------------------
Here is a while loop using a next function. We are printing odd numbers between 1-10
1
3
5
7
9
------------------------------------
Now let's go over for loops. We are looking for even numbers between 0-10
0 is a even number.
1 is a odd number.
2 is a even number.
3 is a odd number.
4 is a even number.
5 is a odd number.
6 is a even number.
7 is a odd number.
8 is a even number.
9 is a odd number.
10 is a even number.
------------------------------------
Now let's print all elements in an array.
a
b
c
d
------------------------------------
Next we are doing a do..while loop and print even numbers between 11-20
11
13
15
17
19
------------------------------------
The last loop we are going over Until Loop and print numbers between 20-25
20
21
22
23
24
25
Lastly, let's use Case Statement to find odd and even numbers between 90-100
90 is even number
91 is odd number
92 is even number
93 is odd number
94 is even number
95 is odd number
96 is even number
97 is odd number
98 is even number
99 is odd number
100 is even number
This concludes Lesson 5
=end