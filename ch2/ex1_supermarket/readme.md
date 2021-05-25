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
<u>Shopper Purchase Grocery Only, Subtotal > Minimum Delivery Requirement</u><br>
The shopper will be able to choose a category of grocery in the main page, and the program will generate a list of items with original price and discounted price. Shopper may choose the item with quantity and place in the basket. Shopper may select check out to check out and end the program.
<br><br>
<u>Shopper Purchase Taxable and Non-Taxable Items, Subtotal > Minimum Delivery Requirement</u><br>
The shopper will be able to choose a category of grocery in the main page, and the program will generate a list of items with original price and discounted price. Shopper may choose the item with quantity and place in the basket. Shopper may select check out to check out and end the program. During the check out process, the program will generate a receipt on the command line and the taxable items will be marked as it would in the real world receipt. The grand total will be added sales tax, but sales tax does not count toward to minimum delivery requirement.
<br><br>
<u>Shopper Purchase Items below Minimum Delivery Requirement, and Continue to Shop until the Subtotal Meet Minimum Delivery Requirement</u><br>
The shopper will be able to choose a category of grocery in the main page, and the program will generate a list of items with original price and discounted price. Shopper may choose the item with quantity and place in the basket. Shopper may select check out to check out and end the program. During the check out process, the program will notify shopper that the subtotal does not meet minimum delivery requirement and offer shopper to continue to shop, if so, the program will bring the shopper back to the main page and shop until user provoke checkout.
<br><br>
<u>Shopper Purchase Items below Minimum Delivery Requirement, but will not Continue to Shop Until the Subtotal Meet Minimum Delivery Requirement</u><br>
The shopper will be able to choose a category of grocery in the main page, and the program will generate a list of items with original price and discounted price. Shopper may choose the item with quantity and place in the basket. Shopper may select check out to check out and end the program. During the check out process, the program will notify shopper that the subtotal does not meet minimum delivery requirement and offer shopper to continue to shop, but when shopper decline, the program will stop.
<br><br>
<u>Shopper Select at least One Item but Leave without any Purchase</u><br>
(Coming Soon...)


## Methods in the Script (Coming Soon...)

