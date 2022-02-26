require 'bike'

class DockingStation
  attr_reader :bikes

  # RIP "Pendleton"
  # RIP "Pendleton 2"

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
    @garage = []
  end

  def release_bike
    raise 'No bikes' if empty?
    raise 'The bike is broken' if @bikes.last.working? == false

    @bikes.pop
  end

  def dock_bike(bike_from_outside, *broken)
    raise "It's full!" if full?

    report_broken(bike_from_outside) unless broken.empty?
    @bikes << bike_from_outside
  end

  def receive_fixed_from_garage(bike)
    @bikes << @garage.pop
  end

  def send_broken_to_garage(bike)
    @garage << @bikes.pop
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