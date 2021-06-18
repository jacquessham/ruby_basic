## Lesson 12: Hash
Hash is the Ruby version of dictionary in Python. File for this lesson: <i>try_hash.rb</i>
<br>
<br>
Hash may be declare with <b>Hash.new</b> or <b>{}</b>, it is also the same structure with JSON format.
<br>
Below is the example code:

```
# Declare new empty hash
mydict = Hash.new

# Hard code new hash with keys and value
mydict = Hash["k1" => 1, "k2" => 2]
mydict = Hash["k1": 1, "k2": 2]

# Add new key and values into hash
mydict.store("k3", 3)
# Or
mydict["k3"] = 3

# Obtain keys in array from hash
keys_arr = mydict.keys

# Obtain value of k1 from hash
v1 = mydict['k1']

# Ruby style to iterate over a hash
mydict.each{|k,v| puts "#{k} has #{v}"}
```
<br>
Some useful method to Hash:
<ul>
	<li>keys: Return all keys in the hash in array</li>
	<li>values: Return all values in the hash in array</li>
	<li>delete(key): Delete the key and value in the hash</li>
	<li>invert: To swap over keys and values</li>
</ul>

## Files
In <i>try_hash.rb</i>, it will declare 2 hash, <i>mydict</i> and <i>mydict2</i>. The script will print all keys and values with various way with <i>mydict</i> and <i>mydict2</i>. It will also try to operate different tasks with the hash methods.