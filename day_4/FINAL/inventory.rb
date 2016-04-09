require './product.rb'
require './category.rb'
class Inventory
  def initialize
    @categories = []
    animals = [
      Product.new("Cats", "Feline friends.", 10.0, 0001),
      Product.new("Dogs", "Caninie companion.", 25.0, 0002),
      Product.new("Goats", "Goats are alright.", 120.0, 0003)];
    @categories << Category.new("Animals", animals)
    pet_food = [
      Product.new("Cat food", "Purina", 5.0, 1001),
      Product.new("Dog food", "Muncho", 8.0, 1002),
      Product.new("Goat food", "Literally anything", 3.0, 1003)];
    @categories << Category.new("Pet Food", pet_food)
    pet_toys = [
      Product.new("Laser pointer", "Drives cats mad", 10.0, 2001),
      Product.new("Chew toy", "Dogs won't chew up your stuff", 9.0, 2002),
      Product.new("Can", "It is a goat", 1.0, 2003)];
    @categories << Category.new("Pet Toys", pet_toys)
    new_category = []
    @categories << Category.new("New Items", new_category)
  end
  def get_product product_name
    puts "-" * 20
    @categories.each do |category|
      category.products.each do |product|
        if product.name == product_name
          return product
        end
      end
    end
    puts "-" * 20
  end
  def list_categories
    puts "*" * 20
    @categories.each do |category|
      puts "\t#{category.name}"
      category.products.each_with_index do |product, i|
        puts "#{i+1}| | #{product.name}\t\t#{product.price}"
      end
    end
    puts "*" * 20
  end
  # def add_product
  #   puts "Enter the product you would like to add."
  #   puts "Format:\"Product,This is a description,0.0(float),301(3-digit integer)\""
  #
  #   section = gets.chomp
  #   section.split
  #
  #   @categories[-1].products << [Product.new(section[0].to_s, section[1].to_s, section[2].to_f, section[3].to_i+3000)]
  #
  # end
end
