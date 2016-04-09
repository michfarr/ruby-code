=begin
User choice
  >WHAT TO DO?

Manage inventory
  > Restock
  > Change prices
  > Stock alerts, option t0 delete items when stock is gone

Manage cart
  > Add to cart
  > Pay for items
  > View cart & total price
  > Remove items from cart

Manage purchase
  > Item
  > Quantity
  > Test if purchase is possible

Discount
  > Member's card

INVENTORY / QUANTITY / PRICE

COMMON > EXOTIC > MYTHICAL
  > cats,     23,   50.0
  > dogs,     10,   120.0
  > birds,    15,   22.0
  > turtles,  200,  5
  > pirahna,  20,   200
  > zebra,    1,    500
  > dodo,     0,    1000000.0
  > unicorn,  1,    1000.0
=end
@inventory = {}
@cart = []
@cart_total
@categories = [:common, :exotic, :extinct, :mythical]

def create_inventory
  @inventory = {
    :common => [
      {:product => "cats",    :quantity => 23,   :price => 50.0,  :refid => "A001"},
      {:product => "dogs",    :quantity => 10,   :price => 120.0, :refid => "A002"},
      {:product => "birds",   :quantity => 15,   :price => 22.0,  :refid => "A003"},
      {:product => "turtles", :quantity => 200,  :price => 5.0,   :refid => "A004"}
    ],
    :exotic => [
      {:product => "shark",   :quantity => 2,    :price => 200.0, :refid => "B001"},
      {:product => "zebra",   :quantity => 1,    :price => 500.0, :refid => "B002"}
    ],
    :extinct => [
      {:product => "dodo",    :quantity => 0,    :price => 1000.0, :refid => "C001"}
    ],
    :mythical => [
      {:product => "unicorn", :quantity => 1, "  price" => 1000.0,  :refid => "D001"}
    ]
  }
end

def show_inventory
  @inventory.each do |category, products|
    puts "*" * 10
    "#{@category.to_s.capitalize}:"

    products.each do |product|
      puts "Animal:\t#{product[:product]}"
      puts "Stock:\t#{product[:quantity]}"
      puts "Price:\t#{product[:price]}"
      puts "Ref. ID\t#{product[:refid]}"
      puts "-" * 15
    end
  end
end

def category_search
  puts "Feel free to search by our animal categories:"
  @categories.each do |category|
    puts "#{category.to_s}"
  end
  puts ""
end

def add_to_cart
end

def add_amount_to_cart
end

create_inventory
