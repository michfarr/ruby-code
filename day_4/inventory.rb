require "./product"
require "./category"

class Inventory

  def initialize
    @categories=[]
    new_items = []
    domestic = [
      Product.new("Cats", "Fabulous felines.", 50.0, 1001),
      Product.new("Dogs", "Canine companions", 120.0, 1002)];
    @categories << Category.new("domestic animals", domestic)
    aquatic = [
      Product.new("Shark", "Ferocious fish", 200.0, 2001),
      Product.new("Piranha", "From the Amazon", 100.0, 2002)];
    @categories << Category.new("aquatic animals", aquatic)
    flying = [
      Product.new("Pigeon", "flying rats", 1.0, 3001),
      Product.new("Dodo", "extinct", 0, 3002)];
      @categories << Category.new("flying animals", flying)
    # @products = []
    # for i in 0..9
    #   @products << Product.new[("#{i}NAME","#{i}description", i.to_f, i)
    # end
  end

# =>    @categories.products << Product.new(to_s,to_s,to_f,to_i)]

  def manage_inventory

  end

  # def add_category selection
  #   p @categories
  #   selection = selection.split(',')
  #   puts "Enter the category name:"
  #
  #   category_name = gets.chomp
  #   if !(@categories.include? category_name)
  #     puts "Input accepted"
  #     new_category = [
  #       Product.new(selection[0].to_s, selection[1].to_s, selection[2].to_f, selection[3].to_i)];
  #     @categories << Category.new(new_category.to_s, new_category)
  #     p @categories[-1]
  #     p @categories.name
  #   else
  #     puts "Category already exists"
  #   end
  # end

  # def add_new_product selection
  #   selection = selection.split(',')
  #   puts "Checking if valid . . . .\nListing current Category choices"
  #
  #   @categories.each_with_index do |category, i|
  #     print "#{i}> #{category.name}\t"
  #   end
  #
  #   puts "Select the desired category index:"
  #   input = gets.chomp.to_i
  #   if input >= @categories.length
  #     "INVALID INPUT: #{input} is greater than the highest index available (#{@categories.length-1})"
  #   else
  #     i = input
  #     @categories[i].name = [
  #       Product.new(selection[0].to_s, selection[1].to_s, selection[2].to_f, selection[3].to_i)];
  #   end
  # end

  # def add_to_category(selection)
  #   if !(@categories.include? selection)
  #     @categories.each do |i|
  #       p "#{i}"
  #     end
  #   else
  #     puts "INVALID INPUT: CATEGORY ALREADY EXISTS (INVENTORY.rb/def add_to_category)"
  #   end
  # end

  def get_product product_name
    @categories.each do |category|
      category.products.each do |product|
        if product.name == product_name
          return product
        end
      end
      "ow no its not here"
    end
  end

  def list
    @categories.each do |category|
      puts category.name
      category.products.each do |product|
        puts "-- #{product.name}:\t\t#{product.description}"
      end
    end
  end
end
