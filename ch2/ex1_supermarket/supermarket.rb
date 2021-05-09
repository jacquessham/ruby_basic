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
		info[curr_line[0]] = info[curr_line[1]]
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
	curr_file = File.new(filename,"r")
	info_arr = IO.readlines(curr_file)

	prod_list = {}
	for prod in info_arr do
		curr_line = prod.strip.split(",")
		temp_prod = Hash[curr_line[1] => curr_line[2]]
		if !prod_list.has_key?(curr_line[0])
			then prod_list[curr_line[0]] = []
		end # end if function
		prod_list[curr_line[0]] << temp_prod
	end # end for loop
	return prod_list
end # end function

info = get_info("acca_supermarket.txt")
price_reg = get_price("price_list.csv")
price_discount = get_price("price_discountlist.csv")

# Test IO
puts "Print info"
for k in info.keys do
	puts "#{k}: #{info[k]}"
end
puts "--------"
puts "Print price_reg"
for k in price_reg.keys do
	puts "#{k}: #{price_reg[k]}"
end