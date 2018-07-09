class Bike

  def initialize(working = true)
    @working = working
  end

  attr_accessor :working

  def report_broken
    @working = false
  end

end
