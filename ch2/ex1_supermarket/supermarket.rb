=begin
get_info() takes a filename and return a hash of metadata of the
supermarket including:
* Name
* Store address
* base delivery fee
* Minimum checkout amount for delivery
* Tax rate
=end
def get_info(filename)
	curr_file = File.new(filename,"r")
	info_arr = IO.readlines(curr_file)

	info = {}

	for line in info_arr do
		curr_line = line.strip.split(":")
		info[curr_line[0]] = curr_line[1]
	end # end for loop
	return info
end # end function

=begin
get_price() takes a filename and return a hash of product with
below structure:

- prod_list (hash)
| - category1 (key,hash)
| -- product1 (key, string), price (value, float)
| -- product2 (key, string), price (value, float)
| - category2 (key,hash)
| -- product3 (key, string), price (value, float)
| -- product4 (key, string), price (value, float)
=end
def get_price(filename)
	# Read file
	curr_file = File.new(filename,"r")
	info_arr = IO.readlines(curr_file)

	# Hash for result
	prod_list = {}
	line_num = 0 # To keep track line num, use for skipping header
	for prod in info_arr do
		# Do it if it is not header
		if line_num != 0 then
			curr_line = prod.strip.split(",")
			# Declare new hash to store product name and price
			temp_prod = Hash[curr_line[1] => curr_line[2]]
			# If category is not here, then declare an array to store
			if !prod_list.has_key?(curr_line[0])
				then prod_list[curr_line[0]] = []
			end # end if function
			# Add temp_prod to the array of categories
			prod_list[curr_line[0]] << temp_prod
		end
		line_num += 1
	end # end for loop
	return prod_list
end # end function

# Function to obtain keys (Either list of categories or products)
def get_keys(curr_dict)
	return curr_dict.keys
end #end function

# Function to print available selection and take input
def get_selection(options_arr, main=true)
	str = ""
	num = 1
	puts 1.class
	for option in options_arr
		str += "#{num} - #{option}\n"
		num += 1
	end # end for loop
	if main then str += "0 - Check Out"
	else str += "0 - Return to previous page"
	end # end if
	puts str
	valid_opts = 0..num
	print "Your selection is: "
	user_input = gets.chomp.to_i
	# Catch if user did not enter a proper answer
	while !valid_opts.include?(user_input)
		puts "Invalid selection, please choose from below options:"
		puts str
		user_input = gets.chomp.to_i
	end
	return user_input
end # end function



# Read all files to prepare to start the program
info = get_info("acca_supermarket.txt")
# List of products sold here
price_reg = get_price("price_list.csv")
# List of products with discount
price_discount = get_price("price_discountlist.csv") 


# Program Main line begins here
puts "Welcome to #{info['store_name']} at #{info['address']}!"
basket = []
shopping = true
categoies = price_reg.keys
while shopping do
	puts "Please enter from the below categoies:"
	choice = get_selection(categoies)
	puts choice
	shopping = false
end
