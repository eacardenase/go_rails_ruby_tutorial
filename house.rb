print "Current scope: "
puts self

class House
  print "Current scope: "
  puts self

  @@count = 0

  def self.count
    @@count
  end

  # attr_reader :count
  # attr_writer :color
  attr_accessor :color, :style

  def initialize(color, style)
    print "Current scope: "
    puts self

    @color = color
    @style = style

    @@count += 1
  end

  # def color
  #   @color
  # end

  # def color=(new_color)
  #   @color = new_color
  # end
end

print House.name + " "
print House.class
puts ":"

puts House.count

house = House.new("white", "craftsman")
puts house.color
puts house.style

puts House.count
