require 'boris_bikes'

describe 'move'  do 
  
  let(:bike) { Bike.new }
  let(:van) { Van.new }
  let(:station) { DockingStation.new }

  it 'moves a bike from docking station to van' do
    station.dock(bike)
    expect(station.available_bikes.count).to be(1)
    expect(van.available_bikes.count).to be(0)
    move(bike, station, van)
    expect(station.available_bikes.count).to be(0)
    expect(van.available_bikes.count).to be(1)
  end
  
end

