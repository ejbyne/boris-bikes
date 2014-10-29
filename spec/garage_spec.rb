require 'garage'

describe Garage do 

  let(:garage) { Garage.new(:capacity => 123) }
#  let(:bike) { Bike.new }
  
  it "should allow setting default capacity on initialising" do
    expect(garage.capacity).to eq(123)
  end
  
  it 'should be able to fix bikes' do
    bike = double(:newbike, :broken? => true)
    allow(bike).to receive(:fix!)
    allow(bike).to receive(:broken?)
    garage.dock(bike)
    garage.fix_bikes # maybe change to fix individual bikes
    expect(bike).not_to be_broken
  end

end