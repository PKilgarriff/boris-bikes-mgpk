class Van
  attr_reader :trunk

  def initialize
    @trunk = []
  end

  def pick_up_broken_bikes(station)
    released = station.release_broken_to_van
    @trunk = released
  end

  def deliver_broken_to_garage(garage)
    @trunk.each { |bike| garage.receive_bike(bike)}
    @trunk.clear
  end

  def pick_up_fixed_bikes(garage)
		@trunk = garage.release_fixed
	end

	def deliver_fixed_bikes(station)
		@trunk.each do |bike|
			station.dock_bike(bike)
		end
		@trunk.clear
	end
end