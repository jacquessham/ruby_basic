# Lesson 1.9 Loading and Saving Data for Specific Format
require 'csv'
require 'json'

BEGIN{puts "This is Lesson 9, we are going Loading and Saving Data for Specific Format in Ruby"}
END{puts "This concludes Lesson 9"}
# Write a csv file first
puts "Now saving a csv file..."
CSV.open("../Data/numbers.csv","w") do |csv_file|
	# Add headers
	csv_file << ["numbers","squared_numbers"]
	for i in 1..10
		csv_file << ["#{i}","#{i**2}"]
	end # End for loop
end # Close csv
puts "csv file saved!"

# Read the csv file just saved
puts "Now reading a csv file just saved"
nums_arr = CSV.read("numbers.csv")
for row in nums_arr
	puts "#{row[0]}, #{row[1]}"
end # End for loop

# Parse a string with csv data
puts "Now converting a string with csv data"
str = "alphabet,vocab\na,apple\nb,boy\nc,cat"
str_arr = CSV.parse(str)
for row in str_arr
	puts "#{row[0]}, #{row[1]}"
end # End for loop

# Then write a json file
puts "Now saving a json file..."
nums = {}
for i in 1..10
	nums[i] = {"2": i**2, "3": i**3}
end # End for loop
File.write("../Data/numbers.json", JSON.dump(nums))
puts "json file saved!"

# Read the json file just saved
puts "Now reading the json file just saved"
json_file = File.read("numbers.json")
nums_dict = JSON.parse(json_file)
for num in nums_dict.keys
	puts "#{num}^2 = #{nums_dict[num]["2"]} and #{num}^3 = #{nums_dict[num]["3"]}"
end # End for loop

# Save the json file in readable indentation
puts "Now save the json file in prettier format, and it looks like:"
pretty_str = JSON.pretty_generate(nums_dict)
puts pretty_str
File.write("../Data/numbers_pretty.json", pretty_str)

=begin
Expected Outcome:
This is Lesson 9, we are going Loading and Saving Data for Specific Format in Ruby
Now saving a csv file...
csv file saved!
Now reading a csv file just saved
numbers, squared_numbers
1, 1
2, 4
3, 9
4, 16
5, 25
6, 36
7, 49
8, 64
9, 81
10, 100
Now converting a string with csv data
alphabet, vocab
a, apple
b, boy
c, cat
Now saving a json file...
json file saved!
Now reading the json file just saved
1^2 = 1 and 1^3 = 1
2^2 = 4 and 2^3 = 8
3^2 = 9 and 3^3 = 27
4^2 = 16 and 4^3 = 64
5^2 = 25 and 5^3 = 125
6^2 = 36 and 6^3 = 216
7^2 = 49 and 7^3 = 343
8^2 = 64 and 8^3 = 512
9^2 = 81 and 9^3 = 729
10^2 = 100 and 10^3 = 1000
Now save the json file in prettier format, and it looks like:
{
  "1": {
    "2": 1,
    "3": 1
  },
  "2": {
    "2": 4,
    "3": 8
  },
  "3": {
    "2": 9,
    "3": 27
  },
  "4": {
    "2": 16,
    "3": 64
  },
  "5": {
    "2": 25,
    "3": 125
  },
  "6": {
    "2": 36,
    "3": 216
  },
  "7": {
    "2": 49,
    "3": 343
  },
  "8": {
    "2": 64,
    "3": 512
  },
  "9": {
    "2": 81,
    "3": 729
  },
  "10": {
    "2": 100,
    "3": 1000
  }
}
This concludes Lesson 9	
=end