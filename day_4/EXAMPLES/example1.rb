require './cat'
require './parrot'

cat1 = Cat.new("Cat", "Blue")
cat2 = Cat.new("Pluk", "White")

parrot1 = Parrot.new("Chuckles", "African gray parrot", "gray")

p parrot1
p(parrot1.sound)
# p cat1.sound
# p cat1.name
#
# cat1.name = "Pluk"
#
# p cat1
