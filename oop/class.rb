require 'pry'

# Using an instance variable
# class Robot
#   attr_accessor :name, :color, :weight, :looking_at
#   def initialize(name = nil, color = nil, weight = nil, looking_at = nil)
#     @name = name
#     @color = color
#     @weight = weight
#     @looking_at = looking_at
#   end
# end


# Using self
class Robot
  attr_accessor :name, :color, :weight, :looking_at
  def initialize(name = nil, color = nil, weight = nil, looking_at = nil)
    self.name = name
    self.color = color
    self.weight = weight
    self.looking_at = looking_at
  end

  def name_test
    puts "My name is #{self.name}"
  end

end

r1 = Robot.new("Tom", "red", 30)
r2 = Robot.new("Jerry", "blue", 40)

r1.looking_at = r2
r2.looking_at = r1

binding.pry
