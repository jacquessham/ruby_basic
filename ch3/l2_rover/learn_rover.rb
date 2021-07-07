require 'rover'


# Option 1
df1 = Rover::DataFrame.new([
		{city: 'Los Angeles', state: 'CA'},
		{city: 'San Francisco', state: 'CA'},
		{city: 'Seattle', state: 'WA'}
	])

# Option 2
df2 = Rover::DataFrame.new({
	city: ['Los Angeles','San Francisco','Seattle'],
	state: ['CA','CA','WA']
	})

# Read a CSV file
df3 = Rover.read_csv('city.csv')

# Select 1 column
puts df1[:city]

# Select 2 columns
puts df1[[:city, :state]]

# Select selected rows in the dataframe
puts df1[1]
puts df1[[1,3]]

# First/Last n rows
puts df1.head
puts df1.first(5)
puts df1.tail
puts df1.last(5)

# Iterate over rows
df1.each_row{|row| puts row}

# Build a dataframe for filtering
df4 = Rover::DataFrame.new({
	col1: ('a'..'z').to_a,
	col2: (1..26).to_a
})

# Printing the filtered dataframe
puts df4[df4[:col1] == 'a']
puts df4[df4[:col2] == 10]
puts df4[df4[:col2] != 10]
puts df4[df4[:col2] >= 10]
puts df4[df4[:col2] <= 10]
puts df4[df4[:col2] > 10]
puts df4[df4[:col2] < 10]
puts df4[(df4[:col1] == 'a') & (df4[:col2] < 10)]
puts df4[(df4[:col1] == 'a') | (df4[:col2] < 10)]

# Math & Stats operation
puts df4[:col2] + 10
puts df4[:col2] - 10
puts df4[:col2] * 10
puts df4[:col2] / 10
puts df4[:col2] % 10
puts df4[:col2] ** 2

puts df4[:col2].count
puts df4[:col2].sum
puts df4[:col2].mean
puts df4[:col2].median
puts df4[:col2].percentile(95)
puts df4[:col2].min
puts df4[:col2].max
puts df4[:col2].std
puts df4[:col2].var

# Union
puts df1.concat(df2)
# Left Join
puts df1.left_join(df2, on: :city)
# Inner Join
puts df1.inner_join(df2, on: [:city, :state])

# Save df4 to a CSV file
df4.to_csv
