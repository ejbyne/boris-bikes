require 'van'

describe Van do
  
  let(:van) { Van.new(:capacity => 15) }
  let(:bike) { Bike.new }
  let(:station) { DockingStation.new }

  it "should accept an initial capacity on initialising" do
    expect(van.capacity).to eq(15)
  end

  # it "can transfer fixed bikes to docking station" do
  #   van.dock(bike)
  #   van.transfer_to(station)
  #   expect(van.bike_count).to eq(0)
  #   expect(station.bike_count).to eq(1)
  # end

end