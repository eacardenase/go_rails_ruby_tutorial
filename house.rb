print "Current scope: "
puts self

class House
  print "Current scope: "
  puts self

  @@count = 0

  def self.count
    @@count
  end

  def self.report_count_of_instances
    "There are #{count} of instances of the '#{name}' class."
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

  def details
    "This is a #{color} #{style} house instance."
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
puts House.report_count_of_instances

house = House.new("white", "craftsman")
puts house.details

puts House.count
puts House.report_count_of_instances
