require 'boris_bikes'

describe Bike do
  it "responds to working?" do
    expect(subject.respond_to?(:working?)).to eq true
  end
end