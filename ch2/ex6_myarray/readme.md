# Exercise 6: MyArray

The goal of this exercise is to practice more on array, class, an loop by creating a class similiar to <i>ArrayList</i> in Java. This exercise is inspired from the homework Lab 4 of CS 112 from the University of San Francisco.

## Requirement
<ol>
	<li>Build a class called <b>MyArray</b> with the following methods:
	<ul>
		<li>Constructor</li>
		<li>addElement</li>
		<li>find</li>
		<li>remove</li>
		<li>shuffle</li>
		<li>reverse</li>
		<li>print_array</li>
		<li>distinct</li>
		<li>findHCF</li>
		<li>getMean</li>
		<li>getMedian</li>
		<li>getSD</li>
	</ul></li>
	<li>The class should only able to store integers</li>
	<li>No gems/packages can be used, beside built-in ones</li>
</ol>

<br>
Here is the explaination of each requirements

### Constructor Method
Use <b>initialize</b> to declare the object, have the following attribute:
<ol>
	<li>arr (The array store in the object), initialize with <b>Array.new(20)</b> before adding any element</li>
	<li>arr_size (The size of the array, size on how many elements in the array)</li>
	<li>arr_maxsize (The physical size of the array)</li>
</ol>

<br>
The array should only accept integers. If there are float numbers, convert those numbers to integers and notify users. If non-number data is received, do not add them to the <i>arr</i> and notify users. Also notify users if there is no element added in to the array when initializing an object. arr_maxsize should be 20 when you initialize by calling <b>Array.new(20)</b>, unless you add more than 20 elements to arr. 
</ol>

### addElement
Add element, elem, to <i>arr</i>. If arr.size >= arr_size, add another 20 <i>nil</i> to arr

### find
Get element, elem, from user and return the position of elem.

### remove
Remove the element, elem, requested from user. Decrement arr_size and move all elements after the removed elements one index before to fill the gap, but maintain arr.size equal to arr_maxsize. If elem is found in arr, delete that element in arr and return <b>true</b>, return <b>false</b> otherwise. If more than one target element was found, only delete the first one. If user wish to delete more than one target element, he should do that in a loop and call this method.

### shuffle
Randomly shuffles elements in the array but never repeat the same postion for each element in the array. Return <b>true</b> if done successful, or <b>false</b> otherwise. Conduct a loop check between the old and new array to confirm. <b>false</b> return if the loop check find unexpected result, or arr is empty array

### reserve
Reverses the array using loops. Return <b>true</b> if done successful, or <b>false</b> otherwise. Conduct a loop check between the old and new array to confirm. <b>false</b> return if the loop check find unexpected result, or arr is empty array

### print_array
print every integer in string, separate by space. Do not return that string.

### distinct
Remove all repeated element.Decrement arr_size and move all elements after the removed elements one index before to fill the gap, but maintain arr.size equal to arr_maxsize.

### findLargestCommonNumber
Get an array of integers from an user (Remember to verify this array, drop all non-integers). Find the largest common number between two arrays. If there is no common number, return nil.

### getMean
Return the mean of arr using loops, do not use any gem.

###	getMedian
Return the median of arr using loops, do not use any gem.

### getSD
Return the standard deviation of arr using loops, do not use any gem.

## Script
The script contain only 1 class: <b>MyArray</b>. Here are the methods in the class:
<ul>
	<li>initalize: Constructor function</li>
	<li>add_arr_sort (Private): Helper function to add element to @arr_sort</li>
	<li>is_int (Private): Helper function to check whether an eleme is an integer</li>
	<li>addElement: Function to add an integer</li>
	<li>find: Function an array of positions to help an element</li>
	<li>remove: Function to remove 1 element if found</li>
	<li>shuffle: Function to shuffle the element positions in MyArray</li>
	<li>reverse: Function to reverse the positions in MyArray</li>
	<li>print_array: Function to return a string of integer elements</li>
	<li>distinct: Function to remove duplicated element in MyArray</li>
	<li>findLargestCommonNumber: Function to find the largest common number</li>
	<li>getMean: Function to return the average</li>
	<li>getMedian: Function to return the median</li>
	<li>getSD: Function to return Standard deviation</li>
</ul>
<br>
There are 6 instances in the class:
<ul>
	<li>@arr: The main array of MyArray</li>
	<li>@size_incre: How many nil added when @arr is full</li>
	<li>@arr_sorted: Sorted @arr</li>
	<li>@arr_stats: Hash of keep track the frequency and positions of elements</li>
	<li>@arr_size: Frequency of non-nil elements</li>
	<li>@arr_maxsize: Physical size of @arr</li>
</ul>

### initalize: Constructor function
Parameters: arr(Array), size(Integer)
<br>
Return: Nothing
<br>
Initiate all instances of the class. Default to have empty array and add 20 nils. @arr_stats is a hash with each element be a key of the hash. Each key creates a sub-hash with two metrics: count and position. Count keeps track of the frequency and position is an array to list the positions of the key. Once the function is called, it will loop over each element from arr to verify it is an integer using <i>is_int</i>. If the element is an integer, it will added to @arr, update @arr_sorted with count and position, update @arr_size, and add it to @arr_sorted using <i>add_arr_sort</i>. Once  If the element is not an integer, it will not add to any instance, but it will print the list of non-integer element. 

### add_arr_sort (Private method)
Parameters: elem(Integer)
<br>
Return: Nothing
<br>
It will add an elem to @arr_sorted. It does not use any package to do so. It uses if-statment to determine the size of @arr_sorted to handle different edge cases.

### is_int (Private method)
Parameters: elem(Integer)
<br>
Return: True/False
<br>
Verify elem whether it is an integer.

### addElement
Parameters: elem(Integer)
<br>
Return: True/False
<br>
Verify whether it is an integer using <i>is_int</i>. If the element is an integer, it will added to @arr, update @arr_sorted with count and position, update @arr_size, and add it to @arr_sorted using <i>add_arr_sort</i>. Once  If the element is not an integer, it will not add to any instance, but it will print it on console to notify the user.

### find
Parameters: elem(Integer)
<br>
Return: Array/Nothing
<br>
To find the position of elem. It will access @arr_stats to obtain an array of position and return it. If the elem does not exist, it will return nil.

### remove
Parameters: elem(Integer)
<br>
Return: True/False
<br>
It first find whether the element exist. If not exist, it return false immediately. If it exist, it will find the position from @arr_stats. If there exists more than 1 of the element, it will only remove the first one. Once the element is remove from @arr, it will update @arr_sorted, @arr_stats. And finally return true.

### shuffle
Parameters: Nothing
<br>
Return: True
<br>
It will shuffle the position of the elements in @arr. It will first enter a loop to reassign new position. If there is at least 1 dupliated position, it will enter to the next loop until none of the elements have a duplicate position. Once the new positions are assigned to @arr, it will update @arr_stats and return true.

### reverse
Parameters: Nothing
<br>
Return: True
<br>
It will reverse the position of all integer elements in @arr (nil will not be affected). Once the new positions are assigned to @arr, it will update @arr_stats and return true.

### print_array
Parameters: Nothing
<br>
Return: String
<br>
It will first subset an array of integer elements and return this list to string.

### distinct
Parameters: Nothing
<br>
Return: True
<br>
It will remove all duplicated elements in @arr, and update @arr_stats and @arr_size. At last return true.

### findLargestCommonNumber
Parameters: Array
<br>
Return: Integer
<br>
Compare an array from user and @arr, find the largest common numbers between two arrays. Return the integer if found, or else it will print a message that no common number found and return nil.

### getMean
Parameters: Nothing
<br>
Return: Float
<br>
Loop over @arr_stats to calculate average (Element times frequency divided by number of elements in @arr). Return the average.

### getMedian
Parameters: Nothing
<br>
Return: Float
<br>
Go to @arr_sorted and find the median in MyArray and return it.

### getSD
Parameters: Nothing
<br>
Return: Float
<br>
Loop over @arr_stats to calculate average first, then use the average calculated to calculate standard deviation.
