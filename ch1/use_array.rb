# Lesson 1.6 Arrays


# Begin and end statment
BEGIN{puts "This is Lesson 6, we are going over arrays in Ruby"}
END{puts "This concludes Lesson 6"}


# Function to print array in string
def arr2str(arr)
	var = "[" 
	for elem in arr do 
		if elem.is_a?(Integer) or elem.is_a?(Float)
			then var += elem.to_s
		elsif elem.to_s.empty? then var += "nil"
		elsif elem.is_a?(TrueClass) or elem.is_a?(FalseClass)
			then var += elem.to_s
		elsif elem.is_a?(String)
			then var += "\""; var += elem ; var += "\""
		else
			var += "<An Object>"
		end
		var += ", "
	end
	var = var[0..-3]
	var += "]"
	return var
end

# Very basic way to declare
arr = [1,2,3]
arr_str = arr2str(arr)
puts "arr = " + arr_str + " becomes "
puts "#{arr}"
puts "The size of arr is #{arr.size}"
puts "----------------------------------------"
arr = ["apple","orange","pear"]
arr_str = arr2str(arr)
puts "arr = " + arr_str + " becomes "
puts "#{arr}"
puts "The size of arr is #{arr.size}"
puts "----------------------------------------"

# Another ways to declare new arrays
puts "To create a 20-elements-array:"
arr11 = Array.new(20)
puts "#{arr11} has #{arr11.size} elements"
puts "----------------------------------------"

# Create an array of a same element repeat 5 times
puts "Create an array with 5 apples:"
arr12 = Array.new(5, "apples") 
puts "#{arr12}"
puts "----------------------------------------"

# Create an array of odd numbers
puts "Create an array of odd numbers"
# This is more like [2*num+1 for num in range(10)] in Python
arr13 = Array.new(10) {|num| num = num*2+1}
puts "#{arr13}"
puts "----------------------------------------"

# Array can contain different data type
arr = [1, "two", 3.5, true]
arr_str = arr2str(arr)
puts "arr = " + arr_str + " becomes "
puts "#{arr}"
puts "The size of arr is #{arr.size}"
puts "----------------------------------------"

# Retrieving element(s) from an Array
print "If we have to select the second element of "
puts "[1, \"two\", 3.5, true]"
puts "#{arr[1]}"
puts "Or if we have to take the second and third elements"
puts "#{arr[2..3]}" # 2-3 is inclusive
puts "Lastly, select the last element:"
puts "#{arr.at(-1)}"
puts "----------------------------------------"

# Inserting new elements
puts "Let's add \"orange\" to the array"
arr << "oranges"
arr_str = arr2str(arr)
puts "#{arr_str}"
puts "----------------------------------------"

# If I have to add an element to the sixth element
print "When we want to add a 'false' at the sixth element, "
puts "while leaving the sixth element empty"
arr[6] = false
arr_str = arr2str(arr)
puts "#{arr_str}"
puts "----------------------------------------"

# Edit a element
puts "Let's change 1 to 5"
arr[0] = 5
arr_str = arr2str(arr)
puts "#{arr_str}"
puts "----------------------------------------"

# Printing at the position greater than array size
puts "Printing at the position greater than array size"
puts "'#{arr[10].to_s}'"
puts "----------------------------------------"

# Add an array to another an array
arr1 = [10, 20]
arr2 = ["apple", "pear"]
arr3 = arr1 + arr2
arr1_str = arr2str(arr1)
arr2_str = arr2str(arr2)
arr3_str = arr2str(arr3)
puts "#{arr1_str} + #{arr2_str} = "
puts "#{arr3_str}"
puts "----------------------------------------"

# Subtract from arrays
arr4 = arr3 - arr1
arr4_str = arr2str(arr4)
puts "#{arr3_str} - #{arr1_str} = "
puts "#{arr4_str}"
puts "----------------------------------------"

# Multiple a array
arr5 = arr4 * 3
arr5_str = arr2str(arr5)
puts "#{arr4_str} * 3 = "
puts "#{arr5_str}"
puts "----------------------------------------"

# Obtain Intersected elements
arr6 = arr2 & arr3
arr6_str = arr2str(arr6)
puts "The Intersected elements between #{arr2_str} and #{arr3_str}"
puts "#{arr6_str}"
puts "----------------------------------------"

# Find length/size
puts "The length of #{arr1_str} is #{arr1.length}"
puts "While the size of #{arr2_str} is #{arr2.size}"
puts "----------------------------------------"

# Sort a list
arr7 = [5, 3, 9]
arr7_str = arr2str(arr7)
arr8 = arr7.sort
arr8_str = arr8_str
puts "Sorted #{arr7_str} is #{arr8_str}"
puts "----------------------------------------"

# Compact an array (Remove nil's)
arr9 = arr.compact
arr9_str = arr2str(arr9)
puts "Compact #{arr_str} becomes #{arr9_str}"
puts "----------------------------------------"

# Transpose
arr10 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
puts "After #{arr10} is transpose:"
puts "#{arr10.transpose}"

=begin
This is Lesson 6, we are going over arrays in Ruby
arr = [1, 2, 3] becomes 
[1, 2, 3]
The size of arr is 3
----------------------------------------
arr = ["apple", "orange", "pear"] becomes 
["apple", "orange", "pear"]
The size of arr is 3
----------------------------------------
To create a 20-elements-array:
[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil] has 20 elements
----------------------------------------
Create an array with 5 apples:
["apples", "apples", "apples", "apples", "apples"]
----------------------------------------
Create an array of odd numbers
[1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
----------------------------------------
arr = [1, "two", 3.5, true] becomes 
[1, "two", 3.5, true]
The size of arr is 4
----------------------------------------
If we have to select the second element of [1, "two", 3.5, true]
two
Or if we have to take the second and third elements
[3.5, true]
Lastly, select the last element
true
----------------------------------------
Let's add "orange" to the array
[1, "two", 3.5, true, "oranges"]
----------------------------------------
When we want to add a 'false' at the sixth element, while leaving the sixth element empty
[1, "two", 3.5, true, "oranges", nil, false]
----------------------------------------
Let's change 1 to 5
[5, "two", 3.5, true, "oranges", nil, false]
----------------------------------------
Printing at the position greater than array size
''
----------------------------------------
[10, 20] + ["apple", "pear"] = 
[10, 20, "apple", "pear"]
----------------------------------------
[10, 20, "apple", "pear"] - [10, 20] = 
["apple", "pear"]
----------------------------------------
["apple", "pear"] * 3 = 
["apple", "pear", "apple", "pear", "apple", "pear"]
----------------------------------------
The Intersected elements between ["apple", "pear"] and [10, 20, "apple", "pear"]
["apple", "pear"]
----------------------------------------
The length of [10, 20] is 2
While the size of ["apple", "pear"] is 2
----------------------------------------
Sorted [5, 3, 9] is 
----------------------------------------
Compact [5, "two", 3.5, true, "oranges", nil, false] becomes [5, "two", 3.5, true, "oranges", false]
----------------------------------------
After [[1, 2, 3], [4, 5, 6], [7, 8, 9]] is transpose:
[[1, 4, 7], [2, 5, 8], [3, 6, 9]]
This concludes Lesson 6
=end