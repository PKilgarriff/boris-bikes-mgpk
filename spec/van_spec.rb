require 'van'

describe Van do
  let(:van) { Van.new }
  let(:station) { DockingStation.new }
  let(:bike) { Bike.new }
  let(:garage) { Garage.new }

  it "picks up broken bikes from the station" do
    station.dock_bike(bike, true)
    van.pick_up_broken_bikes(station)
    expect(van.trunk).to include(bike)
  end

  it 'delivers broken bikes to the garage' do
    station.dock_bike(bike, true)
    van.pick_up_broken_bikes(station)
    van.deliver_broken_to_garage(garage)
    expect(van.trunk).to be_empty
  end

  it "picks up fixed bikes from the garage" do
		garage.receive_bike(bike)
    garage.fix
		van.pick_up_fixed_bikes(garage)
		expect(van.trunk).not_to be_empty
  end

	it "delivers fixed bikes to docking stations" do
		garage.receive_bike(bike)
    garage.fix
		van.pick_up_fixed_bikes(garage)
		van.deliver_fixed_bikes(station)
		expect(van.trunk).to be_empty
	end
end