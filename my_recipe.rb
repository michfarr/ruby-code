=begin

My Recipe

  INGREDIENTS
    KNIFE
      Large onion:    1,        finely diced
      Garlic clove:   4,        minced
      Fresh parsley:  1/4 cup,  finely minced
      Mozzarella:     1 lb,     low-moisture, whole milk, 1/2-inch cubes

knife = Hash.new
knife["veg"] = [quantity, cut, measurement]

    MISE EN PLACE
      Canned tomato:  3 cans,   whole peeled (12oz cans)
      Penne:          1 lb,     dried
      Salt:           to taste
      E.V Olive Oil:  2 TBSP
      Chicken stock:  1 cup
      Itl. Sausage:   1 lb,     spicy

      Oregano:        1 TBSP,   dried
      Red Pepper:     1 tsp,    Crushed

      Butter:         2 TBSP,   unsalted
      Heavy cream:    1 cup
      Ricotta:        12 oz,    high-quality
      Parm-Reg:       3 oz,     roughly grated (Parmigiano-Reggiano)

mise_en_place = Hash.new
mise_en_place["item"] = [quantity, measurement, addendum]

    UTENSILS & POTS/PANS
      Knife,          dicing & mincing
      Large bowl
      Blender
      saute pan
      collander

=end

@ingredients = []

# create a method we can use to call key and value for an ingredients hash
# def geningredients(item,quanity)
#  @ingredients = { item => quantity }
# end

def ing_gen(product, quantity)
  @ingredients << product
  @ingredients << quantity
end

# method to generate ingredients list & to list them after this
# => INDEX:
# => [ 0 - 4 ] Cut these
# => [ 5 - ? ] Mise en place
def ingredients_list
  ing_gen("Large onion", "1")           #1
  ing_gen("Garlic cloves", "4")
  ing_gen("Fresh parsley", "1/4 cup")
  ing_gen("Mozzarella", "1 lb")       #4
  ing_gen("Whole peeled tomatoes", "3 12-ounce cans")   #5
  ing_gen("Dried penne", "1 lb")
  ing_gen("Salt", "to taste")
  ing_gen("Extra virgin olive oil", "2 tablespoons")
  ing_gen("Chicken stock", "1 cup")
  ing_gen("Spicy italian sausage", "1 lb")
  ing_gen("Dried oregano", "1 tablespoon")
  ing_gen("Crushed red pepper", "1 teaspoon")
  ing_gen("Unsalted butter", "2 tablespoon")
  ing_gen("Heavy cream", "1 cup")
  ing_gen("Ricotta", "12 ounces")
  #ing_gen("Parmigiano-Reggiano", "3 ounces")

  puts "#{@ingredients.length}"
  puts "Ingredient:\t\t Amount"

  i = 0
  while i < @ingredients.length
    j = i + 1
    puts "  > #{@ingredients[i]}\t\t #{@ingredients[j]}"
    i += 2
  end
end

# Define method to create a hash for the {item} we wish to cut
# and then an array for [quantity, type of cut, measurement]
def cut_things
  puts "First thing, sharpen your knife!"

  # ["veg"] = [quantity, cut, measurement]
  knife = Hash.new
  knife["large onion"]   =  [1,     "finely dice",              ""]
  knife["garlic cloves"] =  [4,     "mince",                    ""]
  knife["fresh parsley"] =  ["1/4", "finely mince",             " cup"]
  knife["mozzarella"]    =  [1,     "cut into half inch cubes", " lb"]

  # Use each to iterate through the hash and the items in the array.
  knife.each do |hashkey, fromarray|
    puts "Take #{fromarray[0]}#{fromarray[2]} #{hashkey}. Now, #{fromarray[1]}."
  end
end

def cut_things
  puts "First thing, sharpen your knife!"

  # ["veg"] = [quantity, cut, measurement]
  knife = Hash.new
  knife["large onion"]   =  [1,     "finely dice",              ""]

  # Use each to iterate through the hash and the items in the array.
  knife.each do |hashkey, fromarray|
    puts "Take #{fromarray[0]}#{fromarray[2]} #{hashkey}. Now, #{fromarray[1]}."
  end
end


def cook_things
end

#cut_things
#ingredients_list
cook_things

def what_to_do
  cooking = 0
  puts "
  Are you ready to start cooking? (Y/N)
  "
  while cooking.upcase != ("Y" || "N")
    cooking = gets.chomp
  end
end
