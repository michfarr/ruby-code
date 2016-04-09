# Create empty hash for @inventory variable
@inventory = {}
# Create empty string for @cart variable
@cart= ""
# define @total_price at 0.0
@total_price = 0.0

# Use case: restock items and build inventory
# Restock useful in future?
# uses add_to_inventory to quickly add items to hashes
def build_inventory
  add_to_inventory("cats", 4, 50.0)
  add_to_inventory("dogs", 10, 150.0)
  add_to_inventory("unicorn", 1, 1000.0)
end

# Use case: add new pets to inventory
# Allows us to quickly create hashes
def add_to_inventory(category, product, quantity, price, refid)
  @inventory = {
    category => [
      product:  product,
      quantity: quantity,
      price: price,
      refid: refid
    ]
}
end

# Use case: display the items in inventory
def show_inventory
  puts "The following items are currently held in inventory:

  #{@inventory}"
end

# Use case: Customer decideds not to buy
def reshelf(product, quantity)
  # NOT DEFINED IN EXAMPLES
  @inventory[product]["quantity"] += quantity
end

# Use case: Is the product something we carry, is it in stock?
def in_stock?(product, quantity = 1)
  @inventory[product] && @inventory[product]["quantity"] >= quantity
end

# Use case: show contents of the cart * total value of items
def show_contents_of_the_cart
  puts "You currently have the following items:

  #{@inventory}

      Total cart value: €#{@total_cart_value}
  "
end

# Use case: add items to cart
def add_to_cart(product, amount)
  purchase = "  • #{amount} #{product}\n"
  @cart << purchase

  cost_per_item = @inventory[product]["price"]
  @total_cart_value += (cost_per_item * amount)

  @inventory[product]["quantity"] -= amount
end

# Use case: call var build_inventory to create stock for customer
#           call var show_inventory to display stock to customer
build_inventory
show_inventory

# Use case: request user input for purchase
puts "What pet would you like?"
purchase = gets.chomp

# Use case: test if the desired product is in stock with var product = gets.chomp
if in_stock?(purchase)
  puts "How many #{purchase} do you wish to buy?"
  amount = gets.chomp

  # Use case: determine if there is sufficient stock of the item
  if in_stock?(purchase, amount)
    add_to_cart(purchase, amount)

    show_contents_of_the_cart
  end
# Use case: Item does not appear in stock or is at quantity 0
else
  puts "Sorry, we're fresh out of #{purchase}."
end

show_inventory
