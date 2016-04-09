class Parrot
  attr_accessor :name

  def initialize (name, species, color, age)
    @name = name
    @species = species
    @color = gray
    @age = age
  end

  def sound
    "#{@name} wants a cracker?"
  end

  def info
    "#{@name} is a #{@species} that is with #{@color} plumage."
  end

end
