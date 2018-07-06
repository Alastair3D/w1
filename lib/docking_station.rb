require_relative 'bike'

class DockingStation

  def initialize
    @bikes = []
  end

attr_reader :bike #this essentially writes: def bike/@bike/end and...
# enables us to read the @bike attribute on any instance of the Bike class
# This 'attribute (instance variable) reader' gives us a RV of the instance var


  def release_bike
    fail 'No bikes available' if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
  # use an instance var to store the bike in the 'state' or this instance
    fail 'Docking station full' if @bikes.count >= 20
    @bikes << bike
  end

end
