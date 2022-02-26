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
    garage.receive_bike(@trunk)
    @trunk.clear
  end
end