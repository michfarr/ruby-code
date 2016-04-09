require './cart.rb'
require './inventory.rb'
class Shop
  def initialize
    @inventory = Inventory.new
    @cart = Cart.new
  end
  def show_inventory
    @inventory.list_categories
  end
  def get_help
    puts "How can we help you?"
  end
  def checkout
    @cart.pay_shell
  end
  def list_cart
    @cart.list
  end
  # def employee_option
  #   print "USERNAME:\n>"
  #   username = gets.chomp.to_s
  #   print "\nPASSWORD:\n>"
  #   password = gets.chomp.to_s
  #   if(username && password)=="admin"
  #     @inventory.add_product
  #   else
  #     puts "Invalid username or password."
  #   end
  # end

  def options_menu
      puts "1: Catalogue"
      puts "2: Checkout"
      puts "3: View Cart"
      puts "4: Remove item from cart"
      #
      # puts "\n4: Add Products"
      puts "-" * 10 + "\n> "
  end

  def shop_for_item
    shopping = true
    while shopping
      puts "What would you like to do?"
      options_menu

      choice = gets.chomp.to_i
      if(choice == 1)
        show_inventory
        name = gets.chomp

        product = @inventory.get_product name
        @cart.add_product product
      end
      if(choice == 2)
        checkout
        shopping = false
      end
      if(choice == 3)
        list_cart
      end
      # if(choice == 4)
      #   @cart.remove_product
      # end
      # if(choice == 5)
      #   employee_option
      # end
    end
  end
end
