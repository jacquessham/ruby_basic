require 'csv'
require 'json'

# Write a csv file first
puts "Now saving a csv file..."
CSV.open("numbers.csv","w") do |csv_file|
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
File.write("numbers.json", JSON.dump(nums))
puts "json file saved!"

# Read the json file just saved
puts "Now reading the json file just saved"
json_file = File.read("numbers.json")
nums_dict = JSON.parse(json_file)
for num in nums_dict.keys
	puts "#{num}^2 = #{nums_dict[num]["2"]} and #{num}^3 = #{nums_dict[num]["3"]}"
end # End for loop
