require 'docking_station'

describe DockingStation do
  let(:station) { DockingStation.new }
  let(:bike) { double(Bike, working?: true) }

  before(:each) { allow(bike).to receive(:status=).with(false) }

  it 'responds to release_bike' do
    expect(station).to respond_to :release_bike
  end

  it 'releases the bike' do
    station.dock_bike(bike)
    released_bike = station.release_bike
    expect(released_bike).to be_working
  end

  it 'dock_bike is working' do
    expect { station.dock_bike(bike) }.to_not raise_error
  end

  it 'docks the bike' do
    station.dock_bike(bike)
    expect(station.bikes).to include(bike)
  end

  it 'release_bike raises an error when the bikes is empty' do
    expect { station.release_bike }.to raise_error('No bikes')
  end

  it 'release_bike raises an error when the bikes is full' do
    expect do
      (DockingStation::DEFAULT_CAPACITY + 1).times do
        station.dock_bike('cupcake')
      end
    end.to raise_error("It's full!")
  end

  it 'accepts an argument to define the capacity' do
    expect { DockingStation.new(30) }.not_to raise_error
  end

  it 'can be reported that the bike is broken' do
    expect { station.dock_bike(bike, true) }.not_to raise_error
  end

  it 'updates the status of a bike when reported broken' do
    station.dock_bike(bike, true)
    allow(bike).to receive(:working?).and_return (false)
    expect(bike.working?).to be false
  end

  it 'docks the bike even if it is broken' do
    station.dock_bike(bike, true)
    allow(bike).to receive(:working?).and_return (false)
    expect(station.broken_bikes).to include(bike)
  end
end
