require 'daru'


# Declare a dataframe
df = Daru::DataFrame.new(
		student:["Acca","Wilson","Andrew"],
		age:[18,19,20]
	)

puts "Print the data frame"
puts df.inspect

puts "Print the data frame where student is 19 years old"
puts df.where(df[:age].eq(19)).inspect # Even int cannot use ==

puts "Print the data frame where student is named Acca"
puts df.where(df[:student].eq("Acca")).inspect

puts "Select students either called 'Acca' or students who is 20 or older"
puts df.where(df[:student].eq("Acca")|df[:age].mteq(20)).inspect