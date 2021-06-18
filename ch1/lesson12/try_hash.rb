# Lesson 1.12 Hash


# Begin and end statment
BEGIN{puts"This is Lesson 12, we are going to build hash in Ruby"}
END{puts"This concludes Lesson 12"}

# Hard code to declare a new hash
mydict = Hash["k1" => 1, "k2" => 2]
puts "#{mydict}"
mydict2 = Hash["k1": 1, "k2": 2]
puts "#{mydict2}"

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

# Delete key and value in hash
puts "Delete key and value with key is k11"
mydict.delete('k11')
puts mydict

# Ruby style to iterate over a hash
mydict.each{|k,v| puts "#{k} has #{v}"}

# Swap over all keys with values
puts "After swapping keys and values with #{mydict2} becomes #{mydict2.invert}"

=begin
This is Lesson 12, we are going to build hash in Ruby
{"k1"=>1, "k2"=>2}
{:k1=>1, :k2=>2}
There are two arrays:
Keys: ["k0", "k1", "k2", "k3", "k4", "k5", "k6", "k7", "k8", "k9", "k10"]
Values: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
Now inserting keys and values into a new hash
Now printing all key-value pairs from the new hash
k0: 0
k1: 1
k2: 2
k3: 3
k4: 4
k5: 5
k6: 6
k7: 7
k8: 8
k9: 9
k10: 10
Manually add k11 and 11 pair to the new hash
k11: 11
Delete key and value with key is k11
{"k0"=>0, "k1"=>1, "k2"=>2, "k3"=>3, "k4"=>4, "k5"=>5, "k6"=>6, "k7"=>7, "k8"=>8, "k9"=>9, "k10"=>10}
k0 has 0
k1 has 1
k2 has 2
k3 has 3
k4 has 4
k5 has 5
k6 has 6
k7 has 7
k8 has 8
k9 has 9
k10 has 10
After swapping keys and values with {:k1=>1, :k2=>2} becomes {1=>:k1, 2=>:k2}
This concludes Lesson 12
=end