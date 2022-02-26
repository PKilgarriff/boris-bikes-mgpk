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
end