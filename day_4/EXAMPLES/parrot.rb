class Parrot
  attr_accessor :name

  def initialize (name, species, color)
    @name = name
    @species = species
    @color = color
  end

  def sound
    "#{@name} wants a cracker?"
  end

end
