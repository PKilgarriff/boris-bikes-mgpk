describe "it can manage everything" do
	let(:van) { Van.new }
  let(:station) { DockingStation.new }
  let(:bike) { Bike.new }
  let(:garage) { Garage.new }

	it "station sends a broken bike to the garage with a van" do
		station.dock_bike(bike, true)
		van.pick_up_broken_bikes(station)
		van.deliver_broken_to_garage(garage)
		expect(garage.storage).to include(bike)
	end

	it 'station receives a fixed bike from the garage with a van' do
    bike.status=(false)
    garage.receive_bike(bike)
    garage.fix
    van.pick_up_fixed_bikes(garage)
    van.deliver_fixed_bikes(station)
    expect { station.release_bike }.to_not raise_error
  end
end