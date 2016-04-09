require "./inventory"
require './cart'
class Shop
  def initialize
    @inventory = Inventory.new
    @cart = Cart.new
  end
  def what_is_in_store
    @inventory.list
  end
  def shop
    what_is_in_store
    puts "Select item to buy by product name"
    name = gets.chomp
    result = @inventory.get_product name
    p result
    add_to_cart(result)
  end
  def view_catalog
    @inventory.list
  end
  def manage_categories
    puts "What would you like to do?"
    puts "1) Add new category & items\n2) Add to existing category[DISABLED]"
    puts "3) Add new product"
    input = gets.chomp.to_i
    if input == 1
      puts "Enter new PRODUCT details in correct format: product,description,price,id (NO SPACE)"
      selection = gets.chomp
      @inventory.add_category selection
    # elseif input == 2
    #   puts "Enter the category you wish to update?"
    #
    #   selection = gets.chomp
    #   @inventory.add_to_category selection
    elsif input == 3
      puts "Enter the new Product details in correct format: product,description,price,id (NO SPACE)"
      selection = gets.chomp
      @inventory.add_new_product selection
    else
      puts "Invalid Input: Not 1 (shop.rb/def manage_categories)"   # or 2 (shop.rb/def manage_categories)"
    end
  end
  def pay
  end
end
