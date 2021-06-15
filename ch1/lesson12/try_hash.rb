# Lesson 1.12 Hash


# Begin and end statment
BEGIN{puts"This is Lesson 12, we are going to build hash in Ruby"}
END{puts"This concludes Lesson 12"}

# Hard code to declare a new hash
mydict = Hash["k1" => 1, "k2" => 2]
puts "#{mydict}"

# Declare a new hash dynamically
puts "There are two arrays:"
keys = Array.new
values = Array.new
hash_len = 10
for i in 0..hash_len
	keys << "k#{i}"
	values << i
end
puts "Keys: #{keys}"
puts "Values: #{values}"

# Insert all keys and values in a hash
puts "Now inserting keys and values into a new hash"
mydict = Hash.new
for i in 0..hash_len
	mydict.store(keys[i], values[i])
end
# Print all key-value pairs
puts "Now printing all key-value pairs from the new hash"
for k in mydict.keys
	puts "#{k}: #{mydict[k]}"
end

# Manually add new key-value pair
puts "Manually add k11 and 11 pair to the new hash"
mydict['k11'] = 11
puts "k11: #{mydict['k11']}"

