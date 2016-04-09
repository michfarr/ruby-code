require "./product_ex"

class Inventory

  def initialize
    @products = []
    for i in 0..9 do
      @products << Product.new("#{i}Name", "#{i}description", i.to_f, i)
    end
  end
  def get_product product_name
    @products.each do |product|
      if product.name == product_name
        return product
      end
    end
    "ow no its not here"
  end
end
