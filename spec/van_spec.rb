require 'van'

describe Van do
  
  let(:van) { Van.new(:capacity => 15) }
  let(:bike) { Bike.new }
  let(:station) { DockingStation.new }

  it "should allow setting an initial capacity on initialising" do
    expect(van.capacity).to eq(15)
  end

end