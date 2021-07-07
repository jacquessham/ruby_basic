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

## Reference
Reference Documentation <a href="https://sequel.jeremyevans.net/documentation.html">here</a>. 
