class Vehicle
  attr_accessor :model, :year, :color
  @@number_of_vehicles = 0

  def self.number_of_vehicles
    puts @@number_of_vehicles
  end

  def initialize (color,model,year)
    @color = color
    @model = model
    @year = year
    @@number_of_vehicles += 1
  end

  def start_car
    puts "I'm driving"
  end

  def info
    puts "I'm a #{@color} #{@model} from #{@year}"
  end
  def start_engine
    puts "VROOM"
  end
  def age
    puts "This vehicle is #{calculate_age} years old"
  end
private
  def calculate_age
    @age = Time.now.year - @year
  end

end

module Insurable
  def insure(value_of_insurance)
    @value_of_insurance = value_of_insurance
    puts "Your vehicle is insured for #{@value_of_insurance}"
  end

  def is_insured?
    if @value_of_insurance != nil && @value_of_insurance > 0
      puts "Your car is insured"
    else
      puts "You don't have insurance"
    end
  end
end

class MyCar<Vehicle
  include Insurable
PASSANGER_SEATS = 4

  def open_roof
    puts "It's a cabrio, baby!"
  end
end

class MyTruck<Vehicle
CARGO_SPACE=500
attr_accessor :weight,:cargo_type

  def store_cargo(weight,cargo_type)
    @weight=weight
    @cargo_type=cargo_type
    puts "We're storing #{@weight} of #{@cargo_type}"
  end

  def unpack_cargo(taken_weight)
    @weight -= taken_weight 
    puts "We now have #{@weight} of #{@cargo_type}"
  end
end

truck = MyTruck.new("blue","SKA",2001)
puts Vehicle.number_of_vehicles
car = MyCar.new("red","Toyota",1998)
truck = MyTruck.new("black","Volvo",2010)
puts Vehicle.number_of_vehicles
puts car.insure(0000)
puts car.is_insured?
puts truck.age(2015)

p MyCar.ancestors
p MyTruck.ancestors
p Vehicle.ancestors
