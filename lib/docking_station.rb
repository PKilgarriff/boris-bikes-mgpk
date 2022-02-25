class DockingStation
  attr_reader :bikes
  # RIP "Pendleton"

    def initialize
      @bikes = []
    end
  
    def release_bike
      fail "No bikes" if self.empty?
			@bikes.pop
    end
  
    def dock_bike(bike_from_outside)
      fail "It's full!" if self.full?
      @bikes << bike_from_outside
    end

    def empty?
			@bikes.empty?
    end

		def full?
			@bikes.size == 20
		end
  end
  
  class Bike
    def working?
      true
    end
  end