class Category
  attr_reader :name
  attr_accessor :products

  def initialize(name, products)
       # CALL VALUE WITH @CATEGORY[] SAVE ARRAY TO VARIABLE
    @name = name
    @products = products
  end
end
