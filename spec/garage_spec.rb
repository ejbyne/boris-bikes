require 'garage'

describe Garage do
  
  let(:garage) { Garage.new(:capacity => 30) }
  let(:bike) { (Bike.new) }
  let(:van) { (Van.new) }

  it "can accept an initial capacity on initialising" do
    expect(garage.capacity).to eq(30)
  end

  it "can receive broken bikes" do
    bike.break!
    garage.dock(bike)
    expect(garage.bike_count).to eq(1)
  end

  it "can repair broken bikes" do
    bike.break!
    garage.dock(bike)
    expect(garage.available_bikes.size).to eq(0)
    garage.fix_bikes
    expect(garage.available_bikes.size).to eq(1)
  end

  # it "can transfer fixed bikes to van" do
  #   bike.break!
  #   garage.dock(bike)
  #   garage.fix_bikes
  #   garage.transfer_to(van)
  #   expect(garage.bike_count).to eq(0)
  #   expect(van.bike_count).to eq(1)
  # end

end