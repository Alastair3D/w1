require './lib/bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
    @broken_bikes = []
  end

attr_reader :bikes #this essentially writes: def bike/@bike/end and...
# enables us to read the @bike attribute on any instance of the Bike class
# This 'attribute (instance variable) reader' gives us a RV of the inst. var
attr_reader :capacity
attr_accessor :broken_bikes  #this is a setter or writer i.e. a writeable

DEFAULT_CAPACITY = 20

  def release_bike
    fail 'No bikes available' if @bikes.empty? && @broken_bikes.empty?
    fail 'No working bikes available' if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
  # use an instance var to store the bike in the 'state' or this instance
    fail 'Docking station full' if full?
    bike.working ? @bikes.push(bike) : @broken_bikes.push(bike)
  end

  private

  def full?
    @bikes.count + @broken_bikes.count >= @capacity
  end

end
