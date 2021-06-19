# Lesson 9: Loading and Saving Data for Specific Format (CSV, JSON)
Files for this lesson: <i>gets_v2.rb</i>.<br>
In the end of the lesson, you will receive <i>numbers.csv</i> and <i>numbers.json</i>.
<br>
Packages required:
<ul>
	<li>csv</li>
	<li>json</li>
</ul>
<br><br>

### CSV
To read/write a csv file, in vanilla version, use <b>csv</b> gem. <b>CSV.read(filename)</b> will return a 2-D array of data from the csv file you read. To write a csv file, first prepare your data in arrays: Each array represent a row. Then, write the file with following code:

```
CSV.open(filename,"w") do |csv_file|
	for i in # Some 2-D array
		csv_file << i # i is an array with a 2-D array
	end # End for loop
end # Close csv

```

Each loop iteration will add a row to csv_file, and return csv_file to save in a physical CSV file.
<br><br>
Beside a physical CSV file, csv gem can also able to parse a csv style string, simply prepare a string with csv style parse it with <b>CSV.parse(# some string)</b> and it will return an 2-D array

### JSON
To read/write a json file, in vanilla version, use <b>json</b> gem. To read a JSON file, use <b>File.read(filename)</b> to declare a file object first. Then, parse the object with <b>JSON.parse(# file object)</b> and it will return a hash. To write a JSON file, first prepare the hash with data, then use <b>File.write(filename, JSON.dump(# some hash))</b> and it will generate a physical JSON file. If you want the JSON file indented properly, use <b>pretty_generate(# some hash)</b> to convert the string. The below code block demostrate how to write and read a JSON file:

```
# To write a JSON file, nums is a hash previous prepared
File.write("numbers.json", JSON.dump(nums))
# Or write the JSON file intented
File.write("numbers_pretty.json", pretty_generate(nums))

# To read numbers and parse it to a hash
json_file = File.read("numbers.json")
nums_dict = JSON.parse(json_file)
```
## Files
The scripts will do 6 things:
<ol>
	<li>Save a CSV file</li>
	<li>Read the saved CSV file and parse to an array</li>
	<li>Convert a string to CSV format</li>
	<li>Save a JSON file, in 1 row string</li>
	<li>Read the saved JSON file and parse to a hash</li>
	<li>Save a JSON file in a "pretty" format (Multiple lines)</li>
</ol>
