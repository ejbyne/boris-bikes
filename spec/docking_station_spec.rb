require 'docking_station'

describe DockingStation do
  
  let(:station) { DockingStation.new(:capacity => 20) }
  let(:bike) { Bike.new }
  let(:van) { Van.new }

  it "should allow setting initial capacity on initializing" do
    expect(station.capacity).to eq(20)
  end

end