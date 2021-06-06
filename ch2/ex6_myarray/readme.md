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

## Coming Soon...