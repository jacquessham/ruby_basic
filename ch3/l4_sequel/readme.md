# Lesson 4: Sequel

## Overview
Sequel is a package for accessing SQL database for Ruby. In this lesson, we will be focus how to connect to a local Postgres database or GoodData ADS instance.
<br><br>
You may use below command to install:
```
gem install sequel
```

## Files
The file <i>learn_sequel.rb</i> demostrate all the example in the below sections, it relies on the gems <b>sequel</b> and <b>JSON</b>. It assumes the Postgre database contains a table <i>fund_price</i> with columns <i>cp__mutualfundname</i>, <i>d__pricedate</i>, and <i>f__nav</i>. The script first will read a json file with database credentials but it is not provided in this repository. However, it contains the infomation of schema, user name, password, and host in order to connect to the database.

## Connecting to Database
Use <b>Sequel.connect(datebase_url,database_username,database_password)</b> to connect the database. If you are connect to a local Postgres database. Given we have the following credentials, we can use the script below the credentials to connect the local database:
<br>
|Parameters|Value|
|Host|localhost|
|Username|jacquessham|
|Password|db_password|
|Schema|my_db|

```
# Option 1
db = Sequel.postgres('my_db',user: 'jacquessham', password: 'db_password', host: 'localhost')
# Option 2
db = Sequel.connect('postgres://jacquessham:db_password@localhost/my_db')
```

<br>
If you are connecting to a GoodData ADS instance, use the script below the credentials to connect:
|Parameters|Value|
|ADS instance URL|ads_url|
|Username|jacquessham|
|Password|db_password|

```
db = Sequel.connect('ads_url','jacquessham','db_password')
```

## Basic Operations
In order to obtain data from the database, first declare an object connect to the table like below:<br>
<b>ds = db[:fund_price]</b> where <b>[:fund_price]</b> is the table name in the database. The SQL query does not send to the database where this object is created, until <b>ds.all</b> is called to trigger the SQL query to send to the database and retreive the data to local machine. We have <i>ticker</i>, <i>pricedate</i>, <i>nav</i> in the <b>fund_price</b> table. If we want to the data set while filtering the ticker equal to <i>AAPL</i> and sorting by <i>pricedate</i>, we can use the following code:
```
# This is same as select * from fund_price where ticker='AAPL' order by pricedate
result = ds.select(:ticker, :pricedate, :nav).order(:pricedate).where(ticker: 'AAPL').all
```
<br>
If you want to filter with multiple tickers or multiple conditions, use the following code:
```
# This is same as select * from fund_price where ticker='AAPL' and ticker='MSFT' order by pricedate
result = ds.select(:ticker, :pricedate, :nav).order(:pricedate).where(ticker: ['AAPL','MSFT']).all
# This is same as select * from fund_price where ticker='AAPL' and ticker='MSFT' and nav > 300 order by pricedate
result = ds.select(:ticker, :pricedate, :nav).order(:pricedate).where{(ticker: ['AAPL','MSFT']) &  (nav > 300)}.all
```
<br>
Use <i>reverse</i> to sort data in reserve order:
```
# This is same as select * from fund_price order by pricedate desc
result = ds.select(:ticker, :pricedate, :nav).order(:pricedate).reserve.all
# This code also works
result = ds.select(:ticker, :pricedate, :nav).reserve(:pricedate).all
```
<br>
Use <i>limit</i> for limit the rows:
```
# This is same as select * from fund_price limit 5
result = ds.select(:ticker, :pricedate, :nav).limit(5).all
```

## Custom SQL Query
The most convenient way to obtain data from the database by sending the SQL query via the Sequel object, like below:
```
db["select * from fund_price where ticker = 'AAPL'"].all
```
<br>
You may use the placeholder to pass the conditional value into the query (Second parameter is the value):
```
db["select * from fund_price where ticker = ?", "AAPL"].all
```
## Insert Rows
To insert row, use <b>.insert()</b>, like this:
```
dataset = db[:fund_price]
dataset.insert(:ticker => 'GLC', :pricedate => '2021/07/28', :nav => 34.45)
```

<br>
You may insert more than 1 column and it only accept symbol and data pairs. The performance is not great, other tools to insert into database is more preferable.

## Best Practice on Large Data Set
When Sequel retreive data from database, it will retreive arrays of hashes. Each hash represents a row in the table, while it contains metadata like column name, data type along with the data. When the data is retreive with <b>.all()</b> it would break when the memory is used up too much. One solution is to retreive the data row by row using <b>.each()</b> and convert the table to an 2-D array to avoid stacking too much redundant metadata in memory, like below:
```
# Declare a new empty array
data = []
result = ds.select(:ticker, :pricedate, :nav)
# Obtain the data in each row
result.each do |row|
	temp = [] # Build a temporary array for this row
	temp << row[:ticker]
	temp << row[:pricedate]
	temp << row[:nav]
	data << temp # Insert row back to data

end
```


## Reference
Reference Documentation <a href="https://sequel.jeremyevans.net/documentation.html">here</a>. 
