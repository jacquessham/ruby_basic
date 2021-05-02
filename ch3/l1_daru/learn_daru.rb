# Lesson 1: Daru, the Pandas in Ruby
require 'daru'


BEGIN{puts "This is Lesson 1, we are going learn how to use Daru, the Pandas in Ruby"}
END{puts "This concludes Lesson 1"}

# Declare a dataframe
df = Daru::DataFrame.new(
		student:["Acca","Wilson","Andrew"],
		age:[18,19,20]
	)

puts "Print the data frame"
puts df.inspect

# Conditions
puts "Print the data frame where student is 19 years old"
puts df.where(df[:age].eq(19)).inspect # Even int cannot use ==

puts "Print the data frame where student is named Acca"
puts df.where(df[:student].eq("Acca")).inspect

puts "Select students either called 'Acca' or students who is 20 or older"
puts df.where(df[:student].eq("Acca")|df[:age].mteq(20)).inspect

puts "Select students who are not called Acca"
puts df.where(!df[:student].eq("Acca")).inspect

puts "Sort the data frame by Student's name in alphabetical order"
puts df.sort([:student], ascending:[true]).inspect
puts df.inspect

# IOs
puts "Now import students.csv"
begin
	students = Daru::DataFrame.from_csv("students.csv", headers: true)
	puts "Sucessfully loaded"
rescue
	puts "Not able to load file, create an empty dataframe"
	students = Daru::DataFrame.new(student:[],age:[],major:[])
end
puts "The data frame looks like:"
puts students.inspect

puts "Now import gf.csv"
begin
	gf = Daru::DataFrame.from_csv("gf.csv", headers: true)
	puts "Sucessfully loaded"
rescue
	puts "Not able to load file, create an empty dataframe"
	gf = Daru::DataFrame.new(student:[],girlfriend:[])
end

puts "Now let's look which students have a girlfriend"
infos = students.join(gf, how: :outer, on: [:student])
puts infos.inspect

puts "And save the result as infos.csv"
begin
	infos.write_csv("infos.csv")
rescue
	puts "Not able to save the result..."
end

# Arithmetics
prods = Daru::DataFrame.new(
		product:["Apples","Oranges","Peers"],
		price:[80,50,90],
		cost:[60,40,75]
	)
prods[:gross] = prods[:price] + prods[:cost]
prods[:margin] = (prods[:price] - prods[:cost]*1.0)/prods[:price]
puts prods.inspect

# Aggregation
prods = Daru::DataFrame.new(
		category:["Apple","Apple","Orange"],
		productname:["Fuji","Granny Smith","Sunkits"],
		price:[80,95,90],
		cost:[60,80,75]
	)

puts "How many products per category:"
puts prods.group_by([:category]).count[:productname].inspect
puts "Mean of the price:"
puts prods.group_by([:category]).mean[:price].inspect
puts "Standard Deviation of the price:"
puts prods.group_by([:category]).std.inspect
