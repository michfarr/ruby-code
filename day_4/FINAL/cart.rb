class Cart

  def initialize
    @products = []
  end

  def add_product product
    @products << product
  end
  # def index
  #   puts '-----------------------------'
  #   puts "Select the product to remove:"
  #   @products.each_with_index do |product, i|
  #     puts "#{i})\t#{product}"
  #   end
  #   puts "Select the product to remove:"
  #   puts '-----------------------------'
  # end
  # def remove_product
  #   index
  #   print "Enter Index: (Integer)\n>"
  #   input = gets.chomp.to_i
  #
  #   @products.each_with_index do |product, i|
  #     if i == input
  #       @products.delete_at(@products.find_index(i))
  #       print "#{product.name} deleted.\n"
  #     else
  #       puts "Could not find item."
  #     end
  #   end
  # end
  def total_price
    sum = 0
    @products.each do |product|
      sum += product.price
    end
    return sum
  end
  def list
    puts "=" * 20
    puts "Your cart contains the following:"
    @products.each do |product|
      puts "#{product.name}\t\t#{product.price}"
    end
    puts "\nTotal Items:\t#{@products.length}"
    puts "Total Price:\t#{total_price.to_s}"
    puts "=" * 20
  end
  def pay(discount = false)
    if discount
      remainder = apply_discount
      puts "The adjusted total is #{remainder} EUR."
    else
      remainder = total_price
    end
    puts "Thank you for #{remainder} EUR."
  end
  def member_card
    puts "Do you carry our member's card? (Y/N)"
    input = gets.chomp

    if(input == "Y")
      discount = true
    else
      discount = false
    end
    return discount
  end
  def apply_discount
    remainder = total_price
    remainder *= 0.85
    remainder = remainder.round(2)
    return remainder
  end
  def pay_shell
    list
    puts "As shown, your total will currently be #{total_price} EUR."
    discount = member_card
    pay(discount)
  end
end
