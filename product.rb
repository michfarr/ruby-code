class Product
  attr_accessor :name, :description, :price, :id

  def initialize(name, description, price, id)
    @name = name
    @description = description
    @price = price
    @id = id
  end

end
