require_relative 'bike_container'

class DockingStation

  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  # def transfer_to(van)
  #   bikes.each do |bike|
  #     release(bike)
  #     van.dock(bike)
  #   end
  # end

  # def transfer_unavailable_bikes_to(van)
  #   transfer_to(van, unavailable_bikes)
  # end

end