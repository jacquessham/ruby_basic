# Lesson 5: Loops & If-else Statement
File for this lesson: <i>loops.rb</i>
<br>
There are 4 kinds of loops in Ruby:
<ul>
	<li>While Loop</li>
	<li>For Loop</li>
	<li>Do..while Loop</li>
	<li>Until Loop</li>
	<li>Loop..do Loop</li>
</ul>

<br><br>
And will also going over the following function:
<ul>
	<li>If-else Statement</li>
	<li>Case Statement</li>
</ul>

### While Loop
```
curr = 0
while curr < 6 do
	# Do something
	curr += 1
end

while true do
	# Do something
	curr += 1
	break if curr > 10
end
```

### For Loop
```
for n in 0..10 do
	# Do something
end

arr = ['a','b','c']
for ch in arr do
	# Do something
end
```

### Do..while Loop
```
loop do
	# Do something
	break if # Something
end
```

### Until Loop
```
num = 0
until num == 5 do
	puts num+1
	num += 1
end
```

Note: In the above, it will print 0,1,2,3,4

### Loop...do Loop


### Iteration Switch
Ruby also break the loop or skip an iteration. To skip an iteration, use <b>next</b>, the loop will process to the next ieteration immediately. This is the same as <i>continue</i> in Python. Use <b>break</b> to end the loop immediately, the loop will no longer iterating. <b>break</b> can also used in methods, if so, the method will stop immediately.

### If-else Statement
```
if (condition) then (statement)
elsif (condition) then(statement)
else (statement)
end
```

### Case Statement
```
case
	when (condition) then (statement)
	when (condition) then (statement)
	else (statement)
end
```

## Files
In <i>loops.rb</i>, it will go over all loops mentioned above, along with if-statements. First, there are 2 while loops and print between 1-5 and 6-10. Then, it use while loop to print odd numbers between 1-10. After that, there is 2 for loops. The first for loop print whether the numbers between 1-10 are odd or even numbers; the second for loop print all string elements in an array. The next block is to print even numbers using do...while loops. After that, it uses a until loop to print numbers between 19-25. At last, it shows how to use a loop..do loops to print odd or even numbers using case statement.
