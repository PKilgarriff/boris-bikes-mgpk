class DockingStation
  attr_reader :bikes

  def initialize
    @bike = Bike.new
    @bikes = [Bike.new]
  end

  def release_bike
    return Bike.new
  end

  def dock_bike(cupcake)
    p cupcake
    cupcake = "Bonjour"
    p cupcake
  end
end

class Bike
  def working?
    return true
  end
end