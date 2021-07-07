require 'sequel'
require 'JSON'


json_file = File.read("ds_cred.json")
logins = JSON.parse(json_file)

db = Sequel.postgres(logins["schema"], user: logins["username"], password: logins["password"], host: logins["host"])
# Select "fund_price" table/ select * from fund_price
ds = db[:fund_price]

# Retrieve your result
result = ds.all

# This is same as select * from fund_price where cp__mutualfundname='Dividend Large Cap' order by d__pricedate
result = ds.select(:cp__mutualfundname, :d__pricedate, :f__nav).order(:d__pricedate).where(cp__mutualfundname: 'Dividend Large Cap').all

# This is same as select * from fund_price where cp__mutualfundname='Dividend Large Cap' and cp__mutualfundname='Growth Stocks' order by d__pricedate
result = ds.select(:cp__mutualfundname, :d__pricedate, :f__nav).order(:d__pricedate).where(cp__mutualfundname: ['Dividend Large Cap','Growth Stocks']).all
# This is same as select * from fund_price where cp__mutualfundname='Dividend Large Cap' and cp__mutualfundname='Growth Stocks' and f__nav > 300 order by d__pricedate
result = ds.select(:cp__mutualfundname, :d__pricedate, :f__nav).order(:d__pricedate).where{(cp__mutualfundname: ['Dividend Large Cap','Growth Stocks']) &  (f__nav > 24)}.all

# This is same as select * from fund_price order by d__pricedate desc
result = ds.select(:cp__mutualfundname, :d__pricedate, :f__nav).order(:d__pricedate).reserve.all
# This code also works
result = ds.select(:cp__mutualfundname, :d__pricedate, :f__nav).reserve(:d__pricedate).all

# This is same as select * from fund_price limit 5
result = ds.select(:cp__mutualfundname, :d__pricedate, :f__nav).limit(5).all

# Custom SQL Query, pass query into the Sequel object
db["select * from fund_price where ticker = 'Dividend Large Cap'"].all
# Or using placeholderto pass the conditional value
db["select * from fund_price where ticker = ?", "Dividend Large Cap"].all
