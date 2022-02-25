# frozen_string_literal: true

class DockingStation
  attr_reader :bikes

  # RIP "Pendleton"
  # RIP "Pendleton 2"

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    raise 'No bikes' if empty?
    raise 'The bike is broken' if @bikes.last.status == false

    @bikes.pop
  end

  def dock_bike(bike_from_outside, *broken)
    raise "It's full!" if full?

    report_broken(bike_from_outside) unless broken.empty?
    @bikes << bike_from_outside
  end

  private

  def report_broken(bike)
    bike.status = (false)
  end

  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.size >= @capacity
  end
end

class Bike
  attr_accessor :status
  
  def initialize
    @status = true
  end

  def working?
    @status == true
  end
end
