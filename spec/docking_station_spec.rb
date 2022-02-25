require 'boris_bikes'

describe DockingStation do
  it "responds to release_bike" do
    expect(subject.respond_to?(:release_bike)).to eq true
  end

  it 'responds to dock_bike' do
    expect(subject.respond_to?(:dock_bike)).to eq true
  end

  it 'responds to bikes' do
    expect(subject.respond_to?(:bikes)).to eq true
  end

  it "returns an array of bikes when bikes called" do
    expect(subject.bikes.instance_of?(Array)).to eq true 
  end

  it "returns a Bike when requested" do
    expect(subject.release_bike.instance_of?(Bike)).to eq true 
  end

  it 'releases the same bike that has just been docked' do
    # we put in a bike
    # we have some way of identifying that bike ?object id
    # we ask for a bike 
    # we check if it is the same bike (use identifier from above)
  end
end