# frozen_string_literal: true

require 'boris_bikes'

describe Bike do
  let(:bike) { Bike.new }

  it 'responds to working?' do
    expect(bike).to respond_to :working?
  end
end
