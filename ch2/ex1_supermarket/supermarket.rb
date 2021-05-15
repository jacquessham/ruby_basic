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
| - category1 (key, string)
| - | -- product1 (key, string), 
| - | -- | -- price (value, float)
| - | -- product2 (key, string)
| - | -- | -- price (value, float)
| - category2 (key, string)
| - | -- product3 (key, string), 
| - | -- | -- price (value, float)
| - | -- product4 (key, string)
| - | -- | -- price (value, float)
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
			# If category is not here, then declare an array to store
			if !prod_list.has_key?(curr_line[0])
				then prod_list[curr_line[0]] = {}
			end # end if function
			prod_list[curr_line[0]][curr_line[1]] = curr_line[2]
		end
		line_num += 1
	end # end for loop
	return prod_list
end # end function

# Capitalize first letter of every word is going to print 
def title_str(str)
	return str.split.map{|word| word.capitalize}.join(' ')
end # end function

# Print menu
def generate_menu(options_arr, main=true, price_reg=nil, price_discount=nil)
	menu = ""
	num = 1
	for option in options_arr
		# If this is main menu
		if main then
			menu += "#{num} - #{title_str(option)}\n"
		# If this is product menu, add price tag
		else
			menu += "#{num} - #{title_str(option)}\t$#{price_reg[option]}"
			# Check if this option has a discount offer
			# Check if price_discount is None or not
			if !price_discount.nil? # Has to be done individually
				# Check this option is in price_discount
				then if price_discount.include?(option)
					menu += "\tdiscounted --> $#{price_discount[option]}"
				end # end inner if
			end # end middle if
			menu += "\n"
		end # end outter if
		num += 1
	end # end for loop
	if main then menu += "0 - Check Out"
	else menu += "0 - Return to previous page"
	end # end if
	valid_opts = 0..num # Return the valid options available from the menu
	return Hash["valid_opts" => valid_opts, "menu" => menu]
end # End function

# Function to print available selection and take input
def get_selection(valid_opts, menu)
	puts menu
	print "Please enter your selection: "
	user_input = gets.chomp.to_i
	# Catch if user did not enter a proper answer
	while !valid_opts.include?(user_input)
		puts "Invalid selection, please choose from below options:"
		puts str
		user_input = gets.chomp.to_i
	end
	return user_input
end # end function

# Function for user to select product and quantity
=begin
	When calling generate_menu, it is expected to pass: 
	1- category: The user's choice in string that match one of the keys
	             in price_reg/price_discount hashes
	2 - main = false, it is not main menu
	3 - price_reg: The list of products' price, it shall be the hash of 
	              the value in price[category]
	4 - price_discount: Same as price_reg but for discount hash
=end
def choose_product(category, price_reg, price_discount, basket)
	products = price_reg[category].keys
	# See above comment for details
	sub_ui = generate_menu(products, false ,
		                   price_reg[category],
	                       price_discount[category])
	choice = get_selection(sub_ui["valid_opts"], sub_ui["menu"])
	return basket
end # end function


def main
	# Read all files to prepare to start the program
	info = get_info("acca_supermarket.txt")
	# List of products sold here
	price_reg = get_price("price_list.csv")
	# List of products with discount
	price_discount = get_price("price_discountlist.csv") 

	# Program Main line begins here
	puts "Welcome to #{info['store_name']} at #{info['address']}!"
	basket = {}
	shopping = true
	categories = price_reg.keys
	while shopping do
		puts "Please enter from the below categories:"
		ui = generate_menu(categories)
		choice = get_selection(ui["valid_opts"], ui["menu"])
		choice_str = categories[choice-1]
		if choice != 0 then
			puts "You have select #{choice}: #{title_str(choice_str)}"
			basket = choose_product(choice_str, price_reg, price_discount, basket)
		else
			puts "Process to checkout..."
			shopping = false
		end # End if
	end # End while
end # end main program

# Run the program
main