require 'bike_container'

shared_examples "a bike container" do
  
  let(:holder) { described_class.new }
  let(:bike) { double :bike, broken?: false }

  def fill_holder(holder)
    10.times { holder.dock(bike) }
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
    expect(lambda {holder.dock(bike)} ).to raise_error('Station is full')
  end

  it "should provide a list of available bikes" do
    broken_bike = double :bike, broken?: true
    holder.dock(bike)
    holder.dock(broken_bike)
    expect(holder.available_bikes.count).to eq(1)
    expect(holder.unavailable_bikes.count).to eq(1)
  end

  it "should not release a bike which isn't there" do
    expect(lambda { holder.release(bike) }).to raise_error('Cannot process request')
  end

  it "can transfer bikes to other container" do
    van = described_class.new
    holder.dock(bike)
    expect(holder.bike_count).to eq(1)
    holder.transfer_to(van, holder.bikes)
    expect(holder.bike_count).to eq(0)
    expect(van.bike_count).to eq(1)
  end

end
