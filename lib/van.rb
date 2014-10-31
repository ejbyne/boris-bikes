class Van

  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

    # def transfer_to(station)
    # bikes.each do |bike|
    #   if !bike.broken? && !station.full?
    #     self.release(bike)
    #     station.dock(bike)
    #   end
    # end

end