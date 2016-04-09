class Product
  attr_reader :name

  def initialize name
    @name = name
  end
end

class Catalogue
  def initialize
    @list = []
  end
  def print_list
    @list.each_with_index do |product,index|
      puts "#{index + 1}. #{product.name}"
    end
  end
  def add_product product
    @list << product
  end
end

catalogue = Catalogue. new

banana = Product.new("banana")
strawberry = Product.new("strawberry")

catalogue.add_product(banana)
catalogue.add_product(strawberry)

catalogue.print_list
