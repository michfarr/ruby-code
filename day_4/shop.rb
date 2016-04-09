require "./inventory"
require "./cart"
class Shop
  def initialize
    @inventory = Inventory.new
    @cart = Cart.new
  end
  def what_is_in_store
    @inventory.list
  end
  def get_help
    "How can I be of assistance"
  end
  def checkout
    "That will be #{@cart.total_amount}"
  end
  def options_menu
    puts "1: catalogue"
    puts "2: get help"
    puts "3: checkout"
    puts "4: whats in my cart"
  end
  def whats_in_my_cart
    @cart.list
  end
  def shop_for_item
    shopping = true

    while shopping do
      options_menu
      puts "How can I help you?!"

      choice = gets.chomp.to_i

      if(choice == 1)
        what_is_in_store
        name = gets.chomp

        product = @inventory.get_product name
        @cart.add_product(product)

      end
      if(choice == 2)
        get_help
      end
      if(choice == 3)
        checkout
        shopping = false
      end
      if(choice == 4)
        whats_in_my_cart
      end
      if(choice == 5)
        @inventory.manage_inventory
      end
    end
  end
end
