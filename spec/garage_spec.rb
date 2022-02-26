require 'garage'

describe Garage do
  let(:garage) { Garage.new }
  let(:bike) { Bike.new }

  it 'receives broken bikes from the docking station' do
    garage.receive_bike(bike)
    expect(garage.garage).to include(bike)
  end
end