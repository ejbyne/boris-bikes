require 'bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do
  
  let(:bike) { Bike.new }
  let(:holder) { ContainerHolder.new }
  let(:test_station) { DockingStation.new(:capacity => 10) }
  let(:test_van) { Van.new(:capacity => 5) }

  def fill_holder(holder)
    10.times { holder.dock(Bike.new) }
  end

  it "should be able to accept a bike" do
    expect(holder.bike_count).to eq(0)
    holder.dock(bike)
    expect(holder.bike_count).to eq(1)
  end

  it "should be able to release a bike" do
    holder.dock(bike)
    holder.release(bike)
    expect(holder.bike_count).to eq(0)
  end

  it "should know when it's full" do
    expect(holder).not_to be_full
    fill_holder(holder)
    expect(holder).to be_full
  end

  it "should not accept a bike if it's full" do
    fill_holder(holder)
    expect(lambda {holder.dock(bike)} ).to raise_error(RuntimeError)
  end

  it "should provide a list of available bikes" do
    working_bike, broken_bike = Bike.new, Bike.new
    broken_bike.break!
    holder.dock(working_bike)
    holder.dock(broken_bike)
    expect(holder.available_bikes).to eq([working_bike])
  end

  it "should only dock the first bike if more than one given" do
    holder.dock(bike, :second_thing, :third_thing)
    expect(holder.bike_count).to eq(1)
  end

  it "should not allow you to dock something that is not a bike" do
    expect(lambda { holder.dock(:not_a_bike) }).to raise_error(RuntimeError)
  end

  it "should raise an error if empty argument passed to dock" do
    expect(lambda { holder.dock() }).to raise_error(RuntimeError)
  end

  it "should not release a bike which isn't there" do
    expect(lambda { holder.release(bike) }).to raise_error(RuntimeError)
  end

  it 'should raise an error if empty argument passed to release' do
    expect(lambda { holder.release()}).to raise_error(RuntimeError)  
  end

  it 'should only release first bike if more than one requested' do
    holder.dock(bike)
    holder.release(bike, :second_thing, :third_thing)
    expect(holder.bike_count).to eq(0)
  end

  it "can transfer bikes to other container" do
    3.times { test_station.dock(Bike.new) }
    expect(test_station.bike_count).to eq(3)
    test_station.transfer_to(test_van, test_station.bikes)
    expect(test_station.bike_count).to eq(0)
    expect(test_van.bike_count).to eq(3)
  end

  it "cannot transfer more bikes than other container's capacity" do
    6.times { test_station.dock(Bike.new) }
    expect(test_station.bike_count).to eq(6)
    test_station.transfer_to(test_van, test_station.bikes)
    expect(test_station.bike_count).to eq(1)
    expect(test_van.bike_count).to eq(5)
  end

end