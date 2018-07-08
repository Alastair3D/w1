require_relative 'bike'

class DockingStation

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

attr_reader :bike #this essentially writes: def bike/@bike/end and...
# enables us to read the @bike attribute on any instance of the Bike class
# This 'attribute (instance variable) reader' gives us a RV of the inst. var

attr_reader :broken

attr_accessor :capacity
# this is a setter or writer i.e. a writeable

DEFAULT_CAPACITY = 20

  def release_bike
    fail 'No bikes available' if @bikes.empty?
    fail 'No working bikes available' if @broken = true
    @bikes.pop
  end

  def dock(bike)
  # use an instance var to store the bike in the 'state' or this instance
    fail 'Docking station full' if @bikes.count >= DEFAULT_CAPACITY
    @bikes << bike
  end

  private

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end
