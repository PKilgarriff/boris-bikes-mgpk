require 'boris_bikes'

describe DockingStation do
  it "responds to release_bike" do
    expect(subject).to respond_to :release_bike
  end

  it 'responds to dock_bike' do
    expect(subject).to respond_to :dock_bike
  end

  it 'responds to bikes' do
    expect(subject).to respond_to :bikes
  end

  it "returns an array of bikes when bikes called" do
    expect(subject.bikes).to be_instance_of Array
  end

  it "returns a Bike when requested" do
    expect(subject.release_bike).to be_instance_of Bike 
  end

  it 'releases the same bike that has just been docked' do
    # we put in a bike
    # we have some way of identifying that bike ?object id
    # we ask for a bike 
    # we check if it is the same bike (use identifier from above)
  end
end