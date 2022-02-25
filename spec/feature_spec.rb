require 'boris_bikes'

describe 'using a docking station' do
  it 'releases an actual bike that I can check works' do
    station = DockingStation.new
    bike = station.release_bike
    expect(bike.working?).to eq true
  end

  it 'stores a bike when I dock it' do
    station = DockingStation.new
    bike = Bike.new
    station.dock_bike(bike)
    expect(station.bikes[0].instance_of?(Bike)).to eq true
  end

end