require './inventory'

class Shop

  def initialize
    @inventory = Inventory.new
  end

  def what_is_in_store
    p @inventory.inspect
  end

  def shop
    what_is_in_store

    "Enter desired product name:"
    name = gets.chomp

    result = @inventory.get_product name

    p result
  end
end
