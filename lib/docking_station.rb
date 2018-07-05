require_relative 'bike'

class DockingStation

attr_reader :bike #this essentially writes: def bike/@bike/end and...
#enables us to read the @bike attribute on any instance of the Bike class
  def release_bike
    Bike.new
  end

  def dock(bike)
  # use an instance var to store the bike in the 'state' or this instance
    @bike = bike
  end

  # def bike
  # # to give us a return value of the bike we docked
  #   @bike
  # end

end
