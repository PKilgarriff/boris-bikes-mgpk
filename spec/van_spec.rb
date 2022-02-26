require 'van'

describe Van do
	let(:van) { Van.new }
	let(:station) { DockingStation.new }

	it "picks up broken bikes from the station" do
		van.pick_up_broken_bikes(station)
		expect(van.trunk).to be_instance_of(Array)
	end
end