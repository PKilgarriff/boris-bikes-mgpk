require 'garage'

describe Garage do
  let(:garage) { Garage.new }
  let(:bike) { Bike.new }

  it 'receives broken bikes from the van' do
    garage.receive_bike(bike)
    expect(garage.storage).to include(bike)
  end

  it 'fixes the bikes' do
    bike.status=(false)
    garage.receive_bike(bike)
    garage.fix
    expect(bike.working?).to be true
  end

  it 'prepares fixed bikes for a van' do
    garage.receive_bike(bike)
    garage.fix
    expect(garage.fixed_bikes).to_not be_empty
  end

  it "releases fixed bikes" do
    garage.receive_bike(bike)
    garage.fix
    garage.release_fixed
    expect(garage.fixed_bikes).to be_empty
  end
end