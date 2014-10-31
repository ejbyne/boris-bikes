class Garage

  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def fix_bikes
    bikes.each {|bike| bike.fix! }
  end

  # def transfer_to(van)
  #   bikes.each do |bike|
  #     if !bike.broken? && van.bike_count < van.capacity
  #       release(bike)
  #       van.dock(bike)
  #     end
  #   end
  # end

end