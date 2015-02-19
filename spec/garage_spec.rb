require 'spec_helper'
require 'garage'

describe Garage do

  it_behaves_like "a bike container"
  
  let(:garage) { Garage.new(:capacity => 30) }
  let(:bike) { double :bike, broken?: true }

  it "should allow setting an initial capacity on initialising" do
    expect(garage.capacity).to eq(30)
  end

  it "can receive broken bikes" do
    garage.dock(bike)
    expect(garage.bike_count).to eq(1)
  end

  it "can repair broken bikes" do
    garage.dock(bike)
    expect(garage.available_bikes.size).to eq(0)
    expect(bike).to receive(:fix!)
    garage.fix_bikes
  end

end
