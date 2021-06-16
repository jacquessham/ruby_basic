## Lesson 6: Array
File for this lesson: <i>use_array.rb</i>
<br>
It can be found in the [Lesson 6 folder](/lesson6).
<br><br>
### Declaring an Array
These are the style of syntax to declare arrays in Ruby. Arrays are 0-based and do not have a fixed size like Java.
<ul>
	<li>Python style: arr = [1,2,3]</li>
	<li>Java style: arr2 = Array.new(n) <- Create nil n times</li>
	<li>Special way to build an array of strings: arr3 = %w{Mon Tues Fri Sun}</li>
</ul>
<br>
Note: When using the w{} way to declare strings, you do not need to include quotations and commas, each whitespace is treated as a separator

### Selecting/AddingEditing elements
There are a couple ways to select element(s) in an array:
<ul>
	<li>arr[0] - Select 1 element at position 0 of arr</li>
	<li>arr[0..2] - Selecting position 0,1,2 in the arr, positions are inclusive</li>
	<li>arr[-1] - select last element in arr</li>
</ul>

<br><br>
To add an element in an array, simply use: <b>arr << 1</b>
<br>
It will add 1 to the end to arr
<br><br>
Or to edit an element in an array, declare the new value to the array and its position, for example:
<b>arr[0] = "apple"</b>

### Iterating over array
The authentic way to iterate over an array is to use <b>each{}</b>, for example, here is how to use each() to print every element with new lines: 
```
arr.each{|elem| puts elem}
```
If you have more than 1 action, you can do it with <b>each_with_index</b> like:
```
arr.each_with_index do |num, index|
	puts "At position #{index+1}, we have #{num}"
end
```
Or use <b>reverse_each{}</b> to iterate reversely:
```
arr.reverse_each{|elem| puts elem}
```


### Array Functions
<ol>
	<li>There are 2 ways to obtain the size of an array, use the functions: <i>.length</i> and <i>.size</i>.</li>
	<li>arr1 + arr2 - Append the elements in arr2 to the end of arr1</li>
	<li>arr1 - arr2 - If the elements in arr2 appears in elements, those elements will be taken away</li>
	<li>arr * 3 - The elements in arr will be repeated 2 more times (*3 means the time of all elements appears 1*3 times) </li>
	<li>Intersection - See code below the list</li>
	<li>arr.sort - Sort arr from low to high</li>
	<li>arr.compact - Delete nil's in arr</li>
	<li>arr.transpose - Transpose the array elements (Used for martrix in linear algebra)</li>
	<li>arr.uniq! - Find distinct values in the array, in order word: Remove deplicated elements</li>
	<li>arr.reverse - Reverse the array elements</li>
</ol>

```
1. arr.length/ arr.size
2. arr1 + arr2
3. arr1 - arr2
4. arr*3
5. arr1 & arr2
6. arr.sort
7. arr.compact
8. arr.transpose
```
<br><br>
You can split an array but declaring the numbers of variables with the same number of the size of the array. For example:
```
arr = [1, 2, 3]
arr1, arr2, arr3 = arr
```
Then, arr1 is assigned to 1...etc.

### Lazy method
If you call <b>.lazy</b> method to array or hash, then it will become a <i>Enumerator</i> class and will not calculate until a method is called to the array object

```
arr = [1,2,3].lazy.map{|num| num**2}
# arr will become an enumerator object

arr = arr.to_a
# then arr becomes [1,4,9]
```

This new method does not have an obvious benefit until the data set is large, it will prevent using unnecessary amount of memory in temporary variables.