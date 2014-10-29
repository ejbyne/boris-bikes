def move(bike, place_from, place_to)
  place_from.release(bike)
  place_to.dock(bike)
end
