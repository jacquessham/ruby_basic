# Lesson 2: Rover

Rover is another data analysis package in Ruby that is similar to Pandas in Python, created by <a href="https://github.com/ankane">Andrew Kane</a>.

## Files
There is 1 file <i>learn_rover.rb</i> and depends on Rover. It will go over all functionalities mentioned in the folllowing section.

## Creating Data Frames
Here are the ways to declare data frame:
```
# Option 1
df = Rover::DataFrame.new([
		{city: 'Los Angeles', state: 'CA', population: '10M'},
		{city: 'San Francisco', state: 'CA', population: '8M'},
		{city: 'Seattle', state: 'WA', population: '4M'}
	])
# Option 2
df = Rover::DataFrame.new({
	city: ['Los Angeles','San Francisco','Seattle'],
	state: ['CA','CA','WA'],
	population: ['10M','8M','4M']
	})
```
<br>
Reading from a CSV file, <i>city.csv</i>:
```
df = Rover.read_csv('city.csv')
```

## Selecting Data
Selecting data is similar to Pandas in Python, use <b>df[:city]</b> to select the column city in df. To select multiple columns, use <b>df[[:city, :state]]</b> (Use double [] to select mulitple columns like in Pandas). If you place numbers in [] or double [] allows you to select rows by index. For example, if you put <b>df[1]</b> allows you to select the first row of the dataframe; likewise, <b>df[1..3]</b> selects Row 1-3 in dataframe and <b>df[[1,3]]</b> selects Row 1, Row 3 in dataframe. Similar syntax in Pandas like <b>head</b>, <b>first(n)</b>, <b>tail</b>, <b>last(n)</b> represents the first 5 rows, first n rows, last 5 rows, and last n rows of the dataframe. Use <b>keys</b> to obtain the columns in the dataframe. To iterate over rows, put <b>df.each_row{|row| puts row}</b>.

```
# Select 1 column
df[:city]

# Select 2 columns
df[[:city, :state]]

# Select selected rows in the dataframe
df[1]
df[[1,3]]

# First/Last n rows
df.head
df.first(5)
df.tail
df.last(5)

# Iterate over rows
df.each_row{|row| puts row}
```
## Filtering
The syntax of filtering is very similar to Pandas. For example, it you have col1 with alphabets and col2 with numbers:
```
df[df[:col1] == 'a']
df[df[:col2] == 10]
df[df[:col2] != 10]
df[df[:col2] >= 10]
df[df[:col2] <= 10]
df[df[:col2] > 10]
df[df[:col2] < 10]
df[(df[:col1] == 'a') & (df[:col2] < 10)]
df[(df[:col1] == 'a') | (df[:col2] < 10)]
```

## Math & Statistics Function
You may use 6 math operations (Plus:+, Minus:-, Multiply:\*, Module:/%, Power:\*\*) to update the entries like <b>df[:col2] + 10</b>, and 9 statistics function (count, sum, mean, median, percentile(n), min, max, std, var). 
<br><br>
Example:
```
df[:col2] + 10
df[:col2] - 10
df[:col2] * 10
df[:col2] / 10
df[:col2] % 10
df[:col2] ** 2

df[:col2].count
df[:col2].sum
df[:col2].mean
df[:col2].median
df[:col2].percentile(95)
df[:col2].min
df[:col2].max
df[:col2].std
df[:col2].var
```
<br><br>
Use <b>group(colname)</b> to operate a group by aggregation, for example:
```
df.group(:col1).sum
df.group([:col1, :col2]).counts
```

## Joins, Union, Add Columns
To add columns without joins:
```
df1.merge!(df2)
```
<br>

Union:
```
df1.concat(df2)
```

<br>
Left join and Inner join

```
# Left Join
df1.left_join(df2, on: col1)
df1.left_join(df2, on: [:col1, :col2])

# Inner Join
df1.inner_join(df2, on: :col1)
df1.inner_join(df2, on: [:col1, :col2])
```

## Export/Convertion
You may export the dataframe to csv or convert to arrays or hashes:

```
# Export to CSV file
df.to_csv

# Convert to array (each element is a hash, which represent a row), [{}, {}, {}]
df.to_a

# Convert to hash (each element is a array, which represent a column), {col1: [], col2: []}
df.to_h 
```

## Reference
Github Repositories of<a href="https://github.com/ankane/rover"><i>Rover</i></a>.
