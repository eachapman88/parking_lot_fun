class ParkingLot

  attr_reader :spaces, :vehicles

  def initialize(vehicles = [])
    @vehicles = vehicles
  end

  def park(vehicle)
    @vehicles << vehicle
  end

  def leave(vehicle)
    @vehicles.delete(vehicle)
  end

  def print_vehicles
    @vehicles.each do |v|
      puts "Info :> #{v.class} :: #{v.type} :: #{v.color}"
    end
  end

  def num_cars
    count = 0
    @vehicles.each do |vehicle|
      if vehicle.is_a?(Car)
        count += 1
      end
    end
    count
  end

  def num_motos
    count = 0
    @vehicles.each do |vehicle|
      if vehicle.is_a?(Motorcycle)
        count += 1
      end
    end
    count
  end

  def describe_contents
    puts "Number of Cars: #{num_cars}"
    puts "Number of Motorcycles: #{num_motos}"
    puts "Total number of Vehicles: #{num_motos + num_cars}"

    puts "- - - - - - - - - - - - - - - - -"

    @vehicles.each_with_index do |v, idx|
      puts "#{idx + 1}: "
      v.describe_self
    end
  end


end

class Vehicle

  attr_accessor :license_plate, :color, :type

  def initialize(license_plate, color, type)
    @license_plate = license_plate
    @color, @type = color, type
  end

end

class Car < Vehicle
  attr_reader :wheel_num

  def initialize(license_plate, color, type, wheel_num=4)
    super(license_plate, color, type)
    @wheel_num = wheel_num
  end

  def describe_self
    puts "I am a #{self.class} with #{wheel_num} wheels."
    puts "My license plate number is #{license_plate}"
  end

end

class Motorcycle < Vehicle
  attr_reader :wheel_num

  def initialize(license_plate, color, type, wheel_num=2)
    super(license_plate, color, type)
    @wheel_num = wheel_num
  end

  def describe_self
    puts "I am a #{self.class} with #{wheel_num} wheels."
    puts "My license plate number is #{license_plate}"
  end

end

p = ParkingLot.new
c1 = Car.new(47864, "red", "Mercedes")
c2 = Car.new(4387634, "black", "Range Rover")
c3 = Car.new(3553, "Gray", "Aston Martin")
c4 = Car.new(2314, "Yellow", "Ford Fusion")
m1 = Motorcycle.new(243, "Silver", "Ducati")
m2 = Motorcycle.new(3675, "Neon", "Yamaha")
m3 = Motorcycle.new(9998, "Orange", "KTV")

p.park(c1)
p.park(c2)
p.park(c3)
p.park(c4)
p.park(m1)
p.park(m2)
p.park(m3)
