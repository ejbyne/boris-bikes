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
    bikes.delete(bike)
  end

  def full?
    bike_count == capacity
  end

  def available_bikes
    bikes.reject(&:broken?)
  end

  def unavailable_bikes
    bikes.select(&:broken?) #{|bike| bike.broken? }
  end

  def transfer_to(other_container, selected_bikes)
    selected_bikes.each { |selected_bike| release(selected_bike) }
  end

  # def transfer_to(other_container, selected_bikes)
  #   #x = selected_bikes.count
  #   #y = self.bike_count
  #   selected_bikes.each do |selected_bike|
  #     bikes.delete(selected_bike)
  #     other_container.dock(selected_bike)
  #     # release(selected_bike) #unless other_container.full?
  #     # other_container.dock(selected_bike) # unless other_container.full?
  #   end
  #   #z = self.bike_count
  #   #puts "#{y - z} out of #{x} bikes transferred"
  # end

end