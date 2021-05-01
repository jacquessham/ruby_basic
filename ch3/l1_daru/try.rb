require 'daru'


df = Daru::DataFrame.new({
  a: [1,2,3,4,5,6]*100,
  b: ['a','b','c','d','e','f']*100,
  c: [11,22,33,44,55,66]*100
}, index: (1..600).to_a.shuffle)
df.head(5)

selected = df.where(df[:a].eq(2) | df[:c].eq(55))
puts selected.head(5).inspect

