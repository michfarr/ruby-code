@shopping_cart = []

@categories = [ :mats, :props, :clothes, :books ]

@products = {
  :mats => [
    { :reference_number => 1231, :name => "Mat 1", :price => 10 },
    { :reference_number => 1232, :name => "Mat 2", :price => 20 },
  ],
  :props => [
    { :reference_number => 1233, :name => "Block", :price => 30 },
    { :reference_number => 1234, :name => "Meditation cushion", :price => 30 },
  ],
  :clothes => [
    { :reference_number => 1235, :name => "The best T-shirt", :price => 200 },
    { :reference_number => 1236, :name => "The cutest yoga pants", :price => 300 },
  ],
  :books => [
    { :reference_number => 1237, :name => "Bring Yoga To Life", :price => 30 },
    { :reference_number => 1238, :name => "Light On Yoga", :price => 10 },
  ]
}

# Select the category we wish to browse
# Because of the method being called by category = select_category
# The output will be equal to category

# => LOOP
# Prints each @categories[:symbol] as a string
# Then it takes the user input to return as var category
def select_category
  puts "Check out our departments:"

  @categories.each do |category|
    puts "#{category.to_s}"
  end

  puts "Please select one by its name:"
  gets.chomp
end

# Show the products in the category we selected
# Because of the method being called by products = show_products(category)
# The output will be equal to products

# Set category to @categories[:category]
# and create variable (to-be output) for instance var @products[category]
# => LOOP
# @products[:product] is iterated on
# puts Ref ID: #{prod[:refid]}
# puts Product: etc
# puts Product: etc

# returns products (products = @products[ |choices| ])
def show_products(category)
  category = category.to_sym
  products = @products[category]

  products.each do |product|
    puts "Reference nr.: #{product[:reference_number]}"
    puts "Product: #{product[:name]}"
    puts "Price: #{product[:price]} EUR"
  end
  print "#{products}"
  products
end

# Choose ref_id
# A string and gets.chomp for returning user's input
# Method choose_reference_number = reference number
# => add_product_to_card calls this value as its second parameter (& products)
def choose_reference_number
  puts "Select item to buy by its reference_number:"
  gets.chomp
end

# Calls to previous outputs > checks and adds our selection from choose_reference_number
# to the cart

# while true
# product = look_up_product
# if product returns invalid input from reference number,
#
# =>  else causes infinite loop
#
#
def add_product_to_card(products, reference_number)
  while true
      product = look_up_product(products, reference_number)
    if product != nil
      @shopping_cart << product
      puts "Congratulations. '#{product[:name]}' has been added to the cart!"
      break
    else
      puts "I don't think you selected a valid reference_number. Try again:"
    end
  end
end

# called in the while statement of add_product_to_card
# returns product to add_product_to_card
# in reference for @products[:category]
# so long as innput is valid
def look_up_product(products, reference_number)
  products.each do |product|
    if product[:reference_number] == reference_number.to_i
      return product
    end
  end

  nil
end

#called by print card at the bottom
# @cart iterates through @inventory
# prints ref# of @inventory[:cat]
# prints product
# prints price
def print_cart
  puts "*" * 40
  puts "CURRENT SHOPPING CART"
  puts "*" * 40
  @shopping_cart.each do |product|
    puts "Reference nr.: #{product[:reference_number]}"
    puts "Product: #{product[:name]}"
    puts "Price: #{product[:price]} EUR"
    puts "-" * 40
  end

  @shopping_cart
end

puts "Welcome to the Yoga Shop!"
category = select_category
products = show_products(category)
reference_number = choose_reference_number
add_product_to_card(products, reference_number)
print_cart
