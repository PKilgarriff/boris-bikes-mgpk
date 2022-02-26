# require 'docking_station'

class Garage
  attr_reader :garage
  
  def initialize
    @garage = []
  end

  def receive_bike(bike)
    @garage << bike
  end
end