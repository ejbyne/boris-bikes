module BikeContainer

  DEFAULT_CAPACITY = 10

  def bikes
    @bikes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def capacity=(value)
    @capacity = value
  end

  def bike_count
    bikes.count
  end

  def dock(*bike)
    raise "Cannot process request" if bike.first.class != Bike
    raise "Station is full" if full?
    bikes << bike.first
  end

  def release(*bike)
    raise "Cannot process request" if bikes.delete(bike.first).nil?
  end

  def full?
    bike_count == capacity
  end

  def available_bikes
    bikes.reject(&:broken?) #{ |bike| bike.broken? }
  end

  def unavailable_bikes
    bikes.select(&:broken?) #{|bike| bike.broken? }
  end

  def transfer_to(other_container, selected_bikes)
    # x = selected_bikes.count
    # y = bike_count
    selected_bikes.each do |selected_bike|
      release(selected_bike) unless other_container.full?
      other_container.dock(selected_bike) unless other_container.full?
    end
    # z = bike_count
    # puts "#{y - z} out of #{x} bikes transferred"
  end

end