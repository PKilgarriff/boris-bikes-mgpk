require 'bike'

class DockingStation
  attr_reader :bikes, :broken_bikes
  # RIP "Pendleton"
  # RIP "Pendleton 2"

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
    @broken_bikes = []
  end

  def release_bike
    raise 'No bikes' if empty?
    # raise 'The bike is broken' if @bikes.last.working? == false

    @bikes.pop
  end

  def dock_bike(bike_from_outside, *broken)
    raise "It's full!" if full?

    unless broken.empty?
      report_broken(bike_from_outside)
      @broken_bikes << bike_from_outside
    else
      @bikes << bike_from_outside
    end

  end

  def send_broken_to_garage(bike)
    @broken_bikes << @bikes.pop
  end

  def release_broken_to_van
    released = @broken_bikes.clone
    @broken_bikes.clear
    released
  end

  private

  def report_broken(bike)
    bike.status=(false)
  end

  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.size >= @capacity
  end
end