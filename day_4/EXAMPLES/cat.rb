class Cat
  attr_accessor :name

  def initialize(name, fur_color)
    @name = name
    @fur_color = fur_color
  end
  def sound
    "#{@name} says prrrrr"
  end
end
