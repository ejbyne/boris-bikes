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

  def dock(bike)
    raise "Station is full" if full?
    bikes << bike
  end

  def release(bike)
    raise "Cannot process request" if bikes.delete(bike).nil?
  end

  def full?
    bike_count == capacity
  end

  def available_bikes
    bikes.reject(&:broken?)
  end

  def unavailable_bikes
    bikes.select(&:broken?)
  end

  def transfer_to(other_container, selected_bikes)
    selected_bikes.reverse_each do |bike|
      self.release(bike) if other_container.dock(bike) 
    end
  end

end