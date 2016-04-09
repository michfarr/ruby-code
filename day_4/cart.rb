class Cart
  def initialize
    @products = []
  end
  def add_product product
    @products << product
  end

  def total_amount
    sum = 0
    @products.each do |product|
      sum += product.price
    end
    return sum
  end

  def list
    puts "--------------------------------"
    puts "You have in your shopping cart"
    @products.each do |product|
      puts "#{product.name}\t\t#{product.price}"
    end
    puts total_amount.to_s
    puts "--------------------------------"
  end
end
