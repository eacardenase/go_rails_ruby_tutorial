class House
  # attr_reader :color
  # attr_writer :color
  attr_accessor :color

  def initialize(color)
    @color = color
  end

  # def color
  #   @color
  # end

  # def color=(new_color)
  #   @color = new_color
  # end
end

print House.name + " "
p House.class

house = House.new("white")
puts house.color

house.color = "red"
puts house.color
