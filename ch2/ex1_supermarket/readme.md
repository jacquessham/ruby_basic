# Exereice 1: Supermarket Menu

This exerice is to build a supermarket menu for user to interact on command line to select items and calculate the check out total in order to get used to the basic Ruby syntax. This exercise inspired from a homework of CS 110 in the University of San Francisco. 

## Objectives
The objective is to create a Ruby program to interact with users to help them to shop in a hypothetical supermarket. The program will take the supermarket basic information and a list of products with original and discounted price, which it will display to users on a command line to interact with user. Once the users have picked all the products they want, the program will calculate the total and tax, and display a receipt to the users on the command line.

<br><br>
These are required features in the program:
<ul>
	<li>In the main page, display a list of product categories for users to choose from</li>
	<li>Once users select a category, display the list of product, with original price and discounted price</li>
	<li>Add item to the basket, allow users to choose quantity, then return to main page</li>
	<li>Allow users to check what they have picked in the basket</li>
	<li>When the users hit check out, calculate subtotal and sales tax (Sales tax may not be apply to some items, use the rules in California for this exercise)</li>
	<li>Check if the subtotal meet the minimum subtotal for delivery, if not, give users a option to continue shopping or quit the program</li>
	<li>If check out is success, print a page notify the users the order is processed, no need to ask them for credit card info or delivery address</li>
</ul>

## Files Needed for the Script to Run
The program driver script is <i>supermarket.rb</i>. But you will need the following files for input:
<ul>
	<li>Supermarket Information, in text file (This exercise, we use acca_supermarket.txt)</li>
	<li>List of product price, price_list.csv</li>
	<li>List of discounted product price, price_discountedlist.csv</li>
	<li>taxable_ca.csv</li>
</ul>

<br><br>
Supermarket Information includes store name and store address to display in the program, minimum subtotal for delivery, and sales tax rate for taxable items.
<br><br>
List of product price can only has 3 columns: category, product name, and price. None of the column can be null. You may add more items in the list. For the list of discounted product price has the same rule for data, but the file only include the items that are on sales. If the item in product price list, but not in discounted product price, that means that product is not on sales.
<br><br>
taxable_ca.csv included the category that is taxable or not, it has 2 columns: category and taxable. Taxable column should only include 0 or 1, which represents not taxable and taxable, respectively.

## Personas
There are the following personas:
<ul>
	<li>Shopper purchase grocery only, subtotal > minimum delivery requirement</li>
	<li>Shopper purchase taxable and non-taxable items, subtotal > minimum delivery requirement</li>
	<li>Shopper purchase items below minimum delivery requirement, and continue to shop until the subtotal meet minimum delivery requirement</li>
	<li>Shopper purchase items below minimum delivery requirement, but will not continue to shop until the subtotal meet minimum delivery requirement</li>
	<li>Shopper select nothing in the basket and leave</li>
	<li>Shopper select at least one item but leave without any purchase</li>
</ul>

## How to Use this Program for Personas
Shopper Purchase Grocery Only, Subtotal > Minimum Delivery Requirement
<br>
The shopper will be able to choose a category of grocery in the main page, and the program will generate a list of items with original price and discounted price. Shopper may choose the item with quantity and place in the basket. Shopper may select check out to check out and end the program.
<br><br>
Shopper Purchase Taxable and Non-Taxable Items, Subtotal > Minimum Delivery Requirement
<br>
The shopper will be able to choose a category of grocery in the main page, and the program will generate a list of items with original price and discounted price. Shopper may choose the item with quantity and place in the basket. Shopper may select check out to check out and end the program. During the check out process, the program will generate a receipt on the command line and the taxable items will be marked as it would in the real world receipt. The grand total will be added sales tax, but sales tax does not count toward to minimum delivery requirement.
<br><br>
Shopper Purchase Items below Minimum Delivery Requirement, and Continue to Shop until the Subtotal Meet Minimum Delivery Requirement
<br>
The shopper will be able to choose a category of grocery in the main page, and the program will generate a list of items with original price and discounted price. Shopper may choose the item with quantity and place in the basket. Shopper may select check out to check out and end the program. During the check out process, the program will notify shopper that the subtotal does not meet minimum delivery requirement and offer shopper to continue to shop, if so, the program will bring the shopper back to the main page and shop until user provoke checkout.
<br><br>
Shopper Purchase Items below Minimum Delivery Requirement, but will not Continue to Shop Until the Subtotal Meet Minimum Delivery Requirement<br>
The shopper will be able to choose a category of grocery in the main page, and the program will generate a list of items with original price and discounted price. Shopper may choose the item with quantity and place in the basket. Shopper may select check out to check out and end the program. During the check out process, the program will notify shopper that the subtotal does not meet minimum delivery requirement and offer shopper to continue to shop, but when shopper decline, the program will stop.
<br><br>



## Methods in the Script 
### Import Information
get_info
<br>
Required parameter:
<br>
filename: Text file contains Supermarket infomation, including name, address, minimum delivery requirement, sales tax rate (May use <i>acca_supermarket.txt</i> in the folder)
<br>
Description: Method to read file to get supermarket infomation, including name, address, minimum delivery requirement, sales tax rate and return hash.
<br><br>
get_taxables
<br>
Required parameter:
<br>
filename - CSV file contains what categories are taxable (May use <i>taxable_ca.csv</i> in the folder)
<br>
Description: Method to read file to get what categories are taxable, and return hash.
<br><br>
get_price
<br>
Required parameter:
<br>
filename: CSV file contains what products sold in the supermarket, along its categories and price. (May use <i>price_list.csv</i> and <i>price_discountlist.csv</i> in the folder)
<br>
Description: Method to read file to get what products sold in the supermarket, along its categories and price. It will return a hash. It may be used to obtain both regular and discounted price of products sold in supermarket.
<br>
The hash structure looks like this:
```
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
```
### Helper Function for formating
title_str
<br>
Required parameter:
<br>
str: String need to be titlized, may contain more than one word
<br>
Description: Capitalize the first letter of each word in the string, return string

### Program Functionalities
generate_menu
<br>
Required parameter:
<ul>
	<li>options_arr: Hash of categories or products of selected category</li>
	<li>main: Whether this is for main page, if true, 0 is checkout, 1 is back. Default is true</li>
	<li>price_reg: Hash of products with regular price</li>
	<li>price_discount: Hash of products with discount price</li>
</ul>
<br>
Description: Receive a list of categories or products of selected category and format a string to print on console. Return a hash contains: 1. Valid options (List of integers), 2. String to be print on console.

<br><br>
get_selection
<br>
Required parameter:
<ul>
	<li>valid_opts: List of valid integers for users, received in generate_menu</li>
	<li>menu: The formatted string of menu to print on console, received in generate_menu</li>
</ul>
<br>
Description: Print the menu string on console and ask user to choose one of the options in valid_opts, if the input is not valid, it give users 5 more times to enter a valid input. If not, the method will bring back to main page.

<br><br>
add_basket
<br>
Required parameter:
<ul>
	<li>category: Category of the product selected, it will become the key in basket</li>
	<li>product: Product selected</li>
	<li>price: Checkout price of the product selected</li>
	<li>basket: Basket (Hash)</li>
</ul>
<br>
Description: Notify what product the user selected, then ask user to enter the quantity to be placed into basket. If the input is not valid, it give users 5 more times to enter a valid input. If not, the method will bring back to main page. Once the quantity is entered, it will saved in the basket (hash), and return the basket.

The hash structure looks like this:
```
- basket (hash)
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
```
<br><br>
choose_product
<br>
Required parameter:
<ul>
	<li>category: User's choice of category</li>
	<li>price_reg: Hash of products with regular price</li>
	<li>price_discount: Hash of products with discount price</li>
	<li>basket: Basket (Hash)</li>
</ul>
<br>
Description: Method to help user to place product in the basket. It will call generate_menu and get_selection to print menu on console and ask user to choose from the list. Then, it will record the selection in the basket by calling add_basket.

<br><br>
show_basket
<br>
Required parameter:
<br>
basket 
<br>
Description: Print the selections in the basket with formatted string. The formatted string is built in this method.

<br><br>
checkout
<br>
Required parameter:
<ul>
	<li>basket: Basket (Hash)</li>
	<li>taxables: List of categories is taxable (Hash)</li>
	<li>tax: Sales tax rate</li>
	<li>min_delivery: Minimum Delivery Requirement</li>
	<li>delivery_fee: Delivery Fee</li>
</ul>
<br>
Description: Provoke the checkout process, it will follow procedures in How to Use this Program for Personas. If it is successfully checkout, it will print a message and end the while loop in main method.

<br><br>

### Main Method
When the main method is called, it will obtain the supermarket information (get_info), products with regular price (get_price), products with discounted price (get_price), and taxable categories (get_taxables). Then, it will declare a hash for basket and will enter a while loop. The user will select product and quantity each loop until he select checkout.
