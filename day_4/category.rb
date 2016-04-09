class Category
  attr_reader :name, :products

  def initialize("name", products)
    @name = name
    @products = products
  end
end
