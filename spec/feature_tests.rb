require './lib/docking_station.rb'
require './lib/bike.rb'
require './lib/van.rb'

def collect_broken_bikes
  s1 = DockingStation.new
  b1 = Bike.new(working = false)
  station.dock(b1)
  v1 = Van.new
  v1.collect_broken_bikes(s1)
end

def deliver_broken_bikes(garage)
  b1 = Bike.new(working = false)
  v1 = Van.new
  v1.bikes << b1
  v1.deliver_broken_bikes(garage)
end

def collect_repaired_bikes(garage)
  b1 = Bike.new
  v1 = Van.new
  v1.bikes << b1
  v1.collect_repaired_bikes(garage)
end
