require 'docking_station'

describe DockingStation do
  
  let(:station) { DockingStation.new(:capacity => 20) }
  let(:bike) { Bike.new }
  let(:van) { Van.new }

  it "should allow setting initial capacity on initializing" do
    expect(station.capacity).to eq(20)
  end

  # it "can transfer bikes to the van" do
  #   station.dock(Bike.new)
  #   station.dock(Bike.new)
  #   station.dock(Bike.new)
  #   expect(station.bike_count).to eq(3)
  #   station.transfer_to(van)
  #   # expect(station.bike_count).to eq(0)
  #   expect(van.bike_count).to eq(3)
  # end

  # it "can transfer broken bikes to van" do
  #   bike.break!
  #   station.dock(bike)
  #   station.transfer_to(van, station.unavailable_bikes)
  #   expect(station.bike_count).to eq(0)
  #   expect(van.bike_count).to eq(1)
  # end

end