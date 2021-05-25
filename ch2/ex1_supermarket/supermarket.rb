=begin
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXX   Functions to import infomations to get the program  XXXXXXXXXXXXXXXXXX
XXXXXX   running                                             XXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
=end

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

# function to get taxable items
def get_taxables(filename)
	curr_file = File.new(filename,"r")
	info_arr = IO.readlines(curr_file)

	info = []
	row = 0
	for line in info_arr do
		if row != 0 
			then
				curr_line = line.strip.split(",")
				if Integer(curr_line[1]) == 1 then info << curr_line[0] end
		end # end if
		row += 1
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

=begin
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXX             Helper function for formating                XXXXXXXXXXXXXXX
XXXXXX                                                          XXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
=end

# Capitalize first letter of every word is going to print 
def title_str(str)
	return str.split.map{|word| word.capitalize}.join(' ')
end # end function

=begin
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXX        Functions for program functionalities                   XXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
=end

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
			if option.length < 12
				then menu += "#{num} - #{title_str(option)}\t\t$#{price_reg[option]}"
			elsif option.length < 20
				then menu += "#{num} - #{title_str(option)}\t$#{price_reg[option]}"
			else
				menu += "#{num} - #{title_str(option)[0..18]}\t$#{price_reg[option]}"
			end # end if
			# Check if this option has a discount offer
			# Check if price_discount is None or not
			if !price_discount.nil? # Has to be done individually
				# Check this option is in price_discount
				then if price_discount.include?(option)
					menu += "\t\tdiscounted --> $#{price_discount[option]}"
				end # end inner if
			end # end middle if
			menu += "\n"
		end # end outter if
		num += 1
	end # end for loop
	if main 
		then 
			menu += "#{num} - Basket\n"
			menu += "0 - Check Out"
	else 
		menu += "0 - Return to previous page"
	end # end if
	valid_opts = 0..num # Return the valid options available from the menu
	return Hash["valid_opts" => valid_opts, "menu" => menu]
end # End function

# Function to print available selection and take input
def get_selection(valid_opts, menu)
	puts menu
	print "Please enter your selection: "
	user_input = Integer(gets.chomp) rescue -1
	# Catch if user did not enter a proper answer, given 5 attempts
	attempt = 0
	while user_input < 0 and attempt < 5 do
		attempt += 1
		puts "Invalid selection, please choose from below options:"
		puts menu
		user_input = Integer(gets.chomp) rescue -1
	end # End while

	# If users did not enter a proper answer after 5 attempts, return to main page
	if attempt > 4
		then puts "No valid selection is received, return to main page."
		user_input = -1
	end # end if
	return user_input
end # end function

# Function to add item to basket
def add_basket(category, product, price, basket)
	print "You have selected #{product}, which sells at #{price}. "
	print "Please enter the quantity: "
	# Ask user to enter an integer, if not an integer, return a -1
	user_input = Integer(gets.chomp) rescue -1
	# If user enter 0, return to main page
	if user_input == 0
		then
			puts "You have enter 0, nothing is added to the basket, return to main page"
			return basket
	end # end if
	# Conduct a while loop if user do not enter a positive number
	attempt = 0
    while (user_input < 1 and attempt < 5) do
		attempt += 1 # Keep track of attempts in entering the wrong value
		puts "Invalid selection, please enter a number for quantity."
		print "You have selected #{product}, which sells at #{price}. "
		print "Please enter the quantity: "
		user_input = Integer(gets.chomp) rescue -1
	end # end while

	# Allow user for 5 attempts, if not return to main page
	if attempt != 0 
		then puts "You have not entered a valid number, returning to main page."
		return basket
	end # end if

	# Check if category exist in basket
	if !basket.keys.include?(category)
		then basket[category] = {}
	end # end if
	# Check if product exist in category's hash
	if !basket[category].keys.include?(product)
		# If not exist, add new items
		then 
		basket[category][product] = {}
		basket[category][product]["quantity"] = user_input
		basket[category][product]["price"] = price
		puts "#{user_input} #{title_str(product)}(s) has put into the basket."
	# If exist, add quantity
	else
		basket[category][product]["quantity"] += user_input
		puts "#{user_input} more #{title_str(product)}(s) added into the basket."
	end# end if

	return basket
end

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
	# If choice == 0, return to previous page
	if choice == 0 or choice == -1 then return basket end
	# Convert user's input number to product in string
	choice_str = products[choice-1]
	# Find the price of the product
	if price_discount.keys.include?(category)
		then if price_discount[category].include?(choice_str)
			then price = price_discount[category][choice_str]
		end # end inner if
	else
		price = price_reg[category][choice_str]
	end # end outter if
	# Ask user for quantity and add to basket
	basket = add_basket(category, choice_str, price, basket)
	return basket
end # end function

# Function to display the basket
def show_basket(basket)
	# If basket is empty, show nothing
	if basket.size == 0 then puts "The basket is empty!"; return end
	# Showing selection in the basket
	puts "Here are the items in the basket:"
	num = 1
	for category in basket.keys do
		for product in basket[category].keys do
			if product.length < 12
				then puts "#{num} - #{title_str(product)}\t\tx#{basket[category][product]["quantity"]}"
			elsif product.length < 20
				puts "#{num} - #{title_str(product)}\tx#{basket[category][product]["quantity"]}"
			else
				puts "#{num} - #{title_str(product)[0..18]}\tx#{basket[category][product]["quantity"]}"
			end # end if
		end # end for product
	end # end for category
end

# Function to checkout (The basket must have at least 1 item)
def checkout(basket, taxables, tax, min_delivery, delivery_fee)
	subtotal = 0.0
	tax_due = 0.0
	# Build string to print the receipt
	checkout_table = "\tItems\t\t\tPrice\tQuantity\tSubtotal\n"
	for category in basket.keys
		# Find if this category is taxable
		if taxables.include?(category)
			then taxable = true
		else
			taxable = false
		end # end if
		for product in basket[category].keys
			price = basket[category][product]["price"].to_f*1.0
			quantity = basket[category][product]["quantity"]
			subtotal_curr = price*quantity
			if taxable
				checkout_table += "t\t"
				tax_due += subtotal_curr*tax
			else
				checkout_table += "\t"
			end # end if
			subtotal += subtotal_curr
			# Need to format the tabs for different string length
			if product.length < 8
				then checkout_table +=  "#{title_str(product)}\t\t\t#{price.round(2)}\t#{quantity}\t\t#{subtotal_curr.round(2)}\n"
			elsif product.length < 16
				checkout_table +=  "#{title_str(product)}\t\t#{price.round(2)}\t#{quantity}\t\t#{subtotal_curr.round(2)}\n"
			elsif product.length < 20
				checkout_table +=  "#{title_str(product)}\t#{price.round(2)}\t#{quantity}\t\t#{subtotal_curr.round(2)}\n"
			else
				checkout_table +=  "#{title_str(product)[0..18]}\t#{price.round(2)}\t#{quantity}\t\t#{subtotal_curr.round(2)}\n"
			end # end if
		end # end for product
	end # end for category
	checkout_table += "\tTax\t\t\t\t\t\t$#{tax_due.round(2)}\n"
	checkout_table += "\tTotal\t\t\t\t\t\t$#{subtotal.round(2)}"
	# Print receipt
	puts checkout_table
	puts
	puts

	# Check if subtotal minus tax_due is over min_delievery, if not enter this statement
	if (subtotal - tax_due) < min_delivery
		then 
			puts "The subtotal is below the minimum delivery requirement!"
			puts "Please shop until $#{min_delivery.round(2)} in order to complete the transaction."
			print "Do you wish to continue to shop? Enter 1 to continue or 0 to end:"
			user_input = Integer(gets.chomp) rescue -1
			# Try-catch for invalid answer, given 5 attemps
			attempt = 0
			while (user_input < 0 or user_input > 1) and attempt < 5 do
				attempt += 1
				puts "Invalid selection, please enter again.."
				print "Do you wish to continue to shop? Enter 1 to continue or 0 to end:"
				user_input = Integer(gets.chomp) rescue -1
			end # end while
			# If user_input is invalid go back to main page
			if user_input == -1 
				then 
					puts "Invalid selection, going back to main page."
					return true
			# If user_input is 1, go back to main page to continue to shop
			elsif user_input == 1 
				then 
					puts "Returning to main page to continue shopping."
					return true
			# If enter 0, end the everything for good
			else 
				puts "I am sorry to see you leave...Please shop again!"
				return false
			end # end inner if
	end # end outter if

	# Transaction completed! Return false to break the loop
	puts "The delivery fee is $#{delivery_fee.round(2)}."
	puts "Your Grand Total for this transaction is $#{(subtotal+delivery_fee).round(2)}."
	puts "Let's assume I have taken your delivery address and payment method..."
	puts "Thank you for your purchase! Have a good day!"
	return false
end

=begin
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXX         Function to define how main program runs         XXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
=end

def main
	# Read all files to prepare to start the program
	info = get_info("acca_supermarket.txt")
	# List of products sold here
	price_reg = get_price("price_list.csv")
	# List of products with discount
	price_discount = get_price("price_discountlist.csv")
	# List of categories are taxable
	taxables = get_taxables("taxable_ca.csv")

	# Program Main line begins here
	puts "Welcome to #{info["store_name"]} at #{info["address"]}!"
	puts "Please note that the basket need to be shopped at least #{info["minimum_delivery"]} for delivery"
	basket = {}
	shopping = true
	categories = price_reg.keys
	while shopping do
		puts "Please enter from the below categories:"
		ui = generate_menu(categories)
		choice = get_selection(ui["valid_opts"], ui["menu"])
		# If choice receive a -1, process to next iteration
		if choice == -1 then next end 
		# user_input is 1 off from array index of category, need to do choice-1
		choice_str = categories[choice-1]
		# Print the basket
		if choice == categories.size + 1
			then show_basket(basket)
		# Let user to add items into the basket
		elsif choice != 0 then
			puts "You have select #{choice}: #{title_str(choice_str)}"
			basket = choose_product(choice_str, price_reg, price_discount, basket)
		# Process to checkout
		else
			puts "Process to checkout..."
			# Check if anything selected, if not just let user go
			if basket.keys.size == 0
				then puts "Nothing has selected, no balance is due. Please come back to shop. Have a good day!"
				shopping = false
			else
				show_basket(basket)
				puts
				puts
				shopping = checkout(basket, taxables, info["tax"].to_f, info["minimum_delivery"].to_f,
					                info["base_delivery_fee"].to_f)
			end # end if
		end # End if
	end # End while
end # end main program

=begin
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXX               Main Program starts here                  XXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
=end

# Run the program
main