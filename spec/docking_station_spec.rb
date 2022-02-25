require 'docking_station'

describe DockingStation do
  let(:station) { DockingStation.new }
  let(:bike) {Bike.new}

  it "responds to release_bike" do
    expect(station).to respond_to :release_bike
  end

  it "releases the bike" do
    station.dock_bike(bike)
    released_bike = station.release_bike
    expect(released_bike).to be_working
  end

  it "pass bike to a docking station" do
    expect(bike).to be_an_instance_of(Bike)
  end

  it "dock_bike is working" do
    expect { station.dock_bike(bike) }.to_not raise_error
  end
  
  it "docks the bike" do
    station.dock_bike(bike)
    expect(station.bikes).to include(bike)
  end

  # (disabled tests due to inaccessible private methods)

  # it "returns true if the bikes is empty" do 
  #   expect(station.empty?).to be true
  # end

  it "release_bike raises an error when the bikes is empty" do
    expect { station.release_bike }.to raise_error("No bikes")
  end

  # (disabled tests due to inaccessible private methods)

  # it "returns true if the bikes is full" do 
  #   20.times { station.dock_bike(bike) }
  #   expect(station.full?).to be true
  # end

  # it "returns false if the bikes is not full" do 
  #   expect(station.full?).to be false
  # end

  it "release_bike raises an error when the bikes is full" do
    expect { 100000000000000.times { station.dock_bike("cupcake") } }.to raise_error("It's full!")
  end
end

# ### For IRB ###
# require file
# create a new docking station
# create a bike
# release the bike
# raise an error if the bikes is empty


# compare the released bike to see if it's the same one that was docked

# # what is and how to use a guard condition
# # how does ruby raise errors
# # how to use a fail or raise keyword in our lib code
# # how do we test for errors in rspec
