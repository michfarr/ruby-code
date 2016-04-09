@cart = []
@categories = [:domestic, :aquantic, :flying, :other]
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

def user_selection
  puts "What would you like to do?"

  puts
  "
  1. Browse categories.
  2. List inventory.
  3. Add a category to the store.
  4. Add products to category.
  "
  choice = 0
  while choice != (1 || 2 || 3 || 4)
    gets.chomp
  end
end

def navigation(choice)
  case choice
  when 1
    puts "Enjoy!"
  when 2

  when 3

  when 4

end

def add_category(create_category)
  create_category = create_category.to_sym
  @categories.insert(-1, create_category)

  if @categories[0..-2] != @categories.uniq
    puts "Entry Accepted."

    puts "#{@inventory[create_category]}"
  else
    puts "Entry Removed as duplicate."
    @categories.uniq!
  end
end

def add_to_category(new_category, new_product, new_quantity, new_price, new_refid)
    @inventory[new_category.to_sym] << {  :product => new_product.to_s,
                                                  :quantity => new_quantity.to_i,
                                                  :price => new_price.to_f,
                                                  :ref_id => new_refid.to_i }
end

def build_inventory
  add_to_category(:domestic, "dog", 10, 120.0, 1002)
  add_to_category(:aquatic, "turtles", 200, 5.0, 2002)
  add_to_category(:flying, "dodo", 0, 1000.0, 3002)
end

build_inventory

def select_category
  puts "Welcome!  We have the following types available."

  @categories.each do |category|
    puts "#{category.to_s}"
  end

  "Please enter the type:"
  gets.chomp
end

def show_products(category)
  category = category.to_sym
  items = @inventory[category]

  items.each do |item|
    puts "Reference ID: #{item[:ref_id]}"
    puts "Animal:       #{item[:product]}"
    puts "Price:        #{item[:price]}"
  end
  items
end

def select_reference_id
  puts "ENTER REFERENCE ID OF DESIRED PET:"

  gets.chomp          # var reference_id
end
def item_search(items, reference_id)
  items.each { |item| return item if item[:ref_id] == reference_id.to_i }
end


def add_to_cart(items, reference_id)
  while true
    prod = item_search(items, reference_id)
    if items != nil
      @cart << prod
      puts "You've added #{prod[:product]}."
      break
    else
      puts "ERROR: INVALID INPUT"
    end
  end
end

def item_search(items, reference_id)
  items.each { |item| return item if item[:ref_id] == reference_id.to_i }
  nil
end

def cart_total
  puts "Current Cart Status:"

  @cart.each do |thing|
    puts "Reference ID: #{thing[:ref_id]}"
    puts "Animal:       #{thing[:product]}"
    puts "Price:        #{thing[:price]}"
  end

  @cart
end


puts "Thank you for visiting PET LAND"

choice = user_selection
navigation(choice)
category = select_category
items = show_products(category)
reference_id = select_reference_id
add_to_cart(items, reference_id)
cart_total
