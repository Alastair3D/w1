class Van
  attr_reader :bikes

  def initialize
    @bikes  = []
  end

  def collect_broken_bikes(station)
    fail 'No broken bikes to collect' if station.broken_bikes.empty?
    @bikes.concat station.broken_bikes
    station.broken_bikes.clear
    @bikes
  end

  def deliver_broken_bikes(garage)
    garage.bikes.concat @bikes
    @bikes.clear
    @bikes
  end

  def collect_repaired_bikes(garage)
    @bikes.concat garage.bikes
    garage.bikes.clear
    @bikes
  end

  def distribute_repaired_bikes(station)
    fail 'No repaired bikes to distribute' if @bikes.empty?
    station.bikes.concat @bikes
    @bikes.clear
    @bikes
  end
end
