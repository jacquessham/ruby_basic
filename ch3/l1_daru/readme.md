# Lesson 1: Daru

## Overview
Daru is a package in Ruby that is similar to Pandas in Python, it is a data analysis library. It allows you to create data frame with rows and columns and SQL-like functionalities to do analytical works in Ruby.
<br><br>
You may use below command to install:
```
gem install daru
```


## Files
This folder consists of the following files:
<ul>
	<li>learn_ruby.rb</li>
	<li>studnets.csv</li>
	<li>gf.csv</li>
</ul>

## DataFrame
Data frame is the basic unit of object in Daru, to create a data frame, use this syntax:
```
df = DataFrame.new(
		col1: ['a','b','c'],
		col2: [1, 2, 3]
	)
```
## Selecting
Below is the list of syntax to select in different dimension:
<ul>
	<li>df[:col1] - Select 1 column from the data frame</li>
	<li>df[:col1, :col2] - Select multiple columns from the data frame</li>
	<li>df.row[0] - Select 1 row from data frame (Selecting 1st row)</li>
	<li>df.row[0..2] - Select 2 rows from data frame, inclusively (Selecting 1st, 2nd, and 3rd row)</li>
	<li>df.first(n) - The first n rows of the data frame</li>
	<li>df.last(n) - The last n rows of the data frame</li>
</ul>

## Filtering
### Basics
To filter a data frame, use this syntax:
```
df.where(df[:col1].eq('a')) # .eq() is a comparator method, regardless of data type
```
In Daru, it uses the below syntax for comparator method, regardless of data type (Even integer/float are using the below Syntax):
<table>
	<tr>
		<th>Comparator Method</th>
		<th>Functionality</th>
	</tr>
	<tr>
		<td>eq</td>
		<td>==</td>
	</tr>
	<tr>
		<td>not_eq</td>
		<td>!=</td>
	</tr>
	<tr>
		<td>lt</td>
		<td><</td>
	</tr>
	<tr>
		<td>lteq</td>
		<td><=</td>
	</tr>
	<tr>
		<td>mt</td>
		<td>></td>
	</tr>
	<tr>
		<td>mteq</td>
		<td>>=</td>
	</tr>
	<tr>
		<td>in</td>
		<td>Same as the functionality in SQL</td>
	</tr>
</table>

### Multiple Conditions
Sometimes you may want to apply more than 1 condition to the filter.
To do so, use <b>&</b> for <i>and</i> and <b>|</b> for <i>or</i>. For example:

```
df.where(df[:col1].eq('a') & df[:col2].eq(1)) # Both conditions
df.where(df[:col1].eq('b') | df[:col2].eq(3)) # Either conditions
```
### Negation
To negate a condition, simply put <b>!</b> before the condtion. For example:
```
df.where(!df[:col2].eq(1))
```

## Sorting
The sorting function takes an array of columns, and an array of true/false for ascending/decending orders. To sort a data frame, do this:
```
df.sort([:col1], ascending: [true])
```

<br>
Note that the sort's parameters only take array, even you are only sorting 1 column. Also, you have to put <i>ascending:</i> because it is not placed in second parameter in the function.

## Reading/Writing CSV
Use the below syntax to import a CSV file to a data frame or export a data frame to a CSV file:

```
df = Daru::DataFrame.from_csv(<filename.csv>, headers: true)
df.write_csv(<filename.csv>)
```

<br>
Other similar syntax to import from different sources, such as:
<ul>
	<li>from_plaintext</li>
	<li>from_sql</li>
	<li>from_excel</li>
	<li>from_html</li>
</ul>

<br><br>
<b>Unlike Pandas, you must include <i>header: true</i> in order to have headers parse as column name</b>, which is stupid!

## Union (Add rows)
If you want to add rows from a data frame to another data frame, on order words, perform an union between 2 data frame, use <i>.concat</i>, like below:

```
df1 = Daru::DataFrame.new(col1:['a','b','c'],col2:[1,2,3])
df2 = Daru::DataFrame.new(col1:['d','e'],col2:[8,9])

df1.concat(df2)
```

## Joins
To perform SQL style joins, use below syntax similar to Pandas:
```
df1 = Daru::DataFrame.new(col1:['a','b','c'],col2:[1,2,3])
df2 = Daru::DataFrame.new(col1:['a','b','c'],col3:[10,11])

df1.join(df, how: :inner, on: [:col1])
```
<br>
Note that the <b>on</b> parameter only takes array, even with 1 column. The below list is the syntax of different join types on <b>how</b> parameter:
<ul>
	<li>:inner</li>
	<li>:left</li>
	<li>:right</li>
	<li>:outer</li>
</ul>

## Arithmetics among Columns
To take the difference or sum between two columns, simply add/subtract between 2 columns:
```
# df[col1] and df[col2] are 2 float columns
df[sum_col1_col2] = df[col1] + df[col2]
df[diff_col1_col2] = df[col1] - df[col2]

# So do multiple and divide
df[prod_col1_col2] = df[col1] * df[col2]
df[div_col1_col2] = df[col1] / df[col2]
```

## Aggregations
Use the following syntax to perform a group by sum:
```
df.group_by([:col1]).sum
```

<br>
There are more operations you may use:
<ul>
	<li>correlation</li>
	<li>count</li>
	<li>covariance</li>
	<li>cumsum</li>
	<li>describe (Mean, standard deviation, count, min, max at the same time)</li>
	<li>ema (Exponential moving average)</li>
	<li>min</li>
	<li>max</li>
	<li>mean</li>
	<li>median</li>
	<li>mode</li>
	<li>std</li>
	<li>variance_sample</li>
	<li>percent_change</li>
	<li>rolling_count</li>
	<li>rolling_min</li>
	<li>rolling_max</li>
	<li>rolling_count</li>
	<li>rolling_mean</li>
	<li>rolling_median</li>
	<li>rolling_std</li>
	<li>rolling_variance</li>
	<li>standardize</li>
</ul>

<br>
<b>rolling_</b> means look back n rows and perform the given operation. For example, <b>df.rolling_mean(3)</b> means taking a mean between this row and 2 previous rows, inclusively.

<br><br>
<b>.lag(n)</b> means taking entry n rows prior. For example, <b>df.lag(1)</b> means taking last row of entry for every row entry in df.

## Program
The script first declare a data frame with 2 columns. Then, it will filter the data frame with different conditions and perform different sorting. After that, it will read 2 csv files, <i>gf.csv</i> and <i>student.csv</i>, and converting to data frames to perform tables joining. In the last section, it will delcare another data frame to conduct simple aggregation to show the analytical abilities.

## Reference
Andrew Kane's <i>Daru: Pandas for Ruby</i>, <a href="https://ankane.org/daru">https://ankane.org/daru</a>