@cart = []
@categories = [:domestic, :aquantic, :flying, :mythical]
@inventory = {
  :domestic => [
    {:product => "cats",    :quantity => 23,   :price => 50.0,   :ref_id => 1001},
  ],
  :aquatic => [
    {:product => "shark",   :quantity => 2,    :price => 200.0,  :ref_id => 2001},
  ],
  :flying => [
    {:product => "birds",   :quantity => 15,   :price => 22.0,   :ref_id => 3001},
  ],
  :Other => [
    {:product => "0", :quantity => 0,    :price => 0.0, :ref_id => 0000}
  ]
}

# Select the category we wish to browse
# Because of the method being called by category = select_category
# The output will be equal to category
#
# => LOOP
# Prints each @categories[:symbol] as a string
# Then it takes the user input to return as var category
def select_category
  puts "Welcome!  We have the following types available."

  @categories.each do |category|
    puts "#{category.to_s}"
  end

  "Please enter the type:"
  gets.chomp
end

# Show the products in the category we selected
# Because of the method being called by products = show_products(category)
# The output will be equal to products

# Set category to @categories[:category]
# and create variable (to-be output) for instance var @products[category]
# => LOOP
# @products[:product] is iterated on
# puts Ref ID: #{prod[:ref_id]}
# puts Product: etc
# puts Product: etc

# returns products (products = @products[ |choices| ])
def show_products(category)
  items = @inventory[category]
  @inventory.each do |item|
    puts "Reference ID: #{item[:ref_id]}"
    puts "Animal:       #{item[:product]}"
    puts "Price:        #{item[:price]}"
  end
  items               # var items
end

# Choose ref_id
# A string and gets.chomp for returning user's input
#
# Method choose_reference_number = reference number
# => add_product_to_card calls this value as its second parameter (& products)
def select_reference_id
  puts "ENTER REFERENCE ID OF DESIRED PET:"

  gets.chomp          # var reference_id
end

# Calls to previous outputs > checks and adds our selection from choose_reference_number
# to the cart

# while true
# product = look_up_product
# if product returns invalid input from reference number,
#
# =>  else causes infinite loop
#
# if not nil, then it adds product from the selected ref# to cart
def add_to_cart(items, reference_id)
  i = 0
  while true
    prod = item_search(items, reference_id)
    if items != nil
      @cart << prod
      puts "You've added #{prod[:product]}."
      break
    else
      puts "ERROR: INVALID INPUT"
      i++
    end
  end unless i >= 3
end


# called in the while statement of add_product_to_card
# => LOOP
# returns product to add_product_to_card
# in reference for @products[:category]
# so long as innput is valid
def item_search(items, reference_id)
  items.each { |item| return item if item[:ref_id] == reference_id.to_i }
  nil
end

#called by print card at the bottom
# @cart iterates through @inventory
# prints ref# of @inventory[:cat]
# prints product
# prints price
def cart_total
  puts "Current Cart Status:"

  @cart.each do |thing|
    puts "Reference ID: #{thing[:ref_id]}"
    puts "Animal:       #{thing[:product]}"
    puts "Price:        #{thing[:price]}"
  end

  @cart
end

"Thank you for visiting PET LAND"
category = select_category
items = show_products(category)
reference_id = select_reference_id
add_to_cart(items, reference_id)
cart_total
