# require 'docking_station'

class Garage
  attr_reader :storage, :fixed_bikes
  
  def initialize
    @storage = []
    @fixed_bikes = []
  end

  def receive_bike(bike)
    @storage << bike
  end

  def fix
    @fixed_bikes = @storage.each do |bike|
      bike.status=(true)
    end.clone
    @storage.clear
  end

  def release_fixed
    fixed = @fixed_bikes.clone
    @fixed_bikes.clear
    fixed
  end
end