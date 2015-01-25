# Boris Bikes

## Summary

This was our Week 1 project at Makers Academy.

The task was to create a simple system for managing Boris Bikes in London in Ruby.

## Technologies Used

- Ruby
- Rspec

## Job List

- The system must keep track of a number of docking stations and the bikes.
- It must allow a user to rent the bikes and return them.
- Occasionally the bikes will break and then they will be unavailable for rental.
- There must also be a garage to fix the bikes and a van to move the bikes between the stations and the garage.

## Favourite Code Snippet

Method for transferring bikes between vans/docking stations etc:
~~~
  def transfer_to(other_container, selected_bikes)
    selected_bikes.reverse_each do |bike|
      self.release(bike) if other_container.dock(bike) 
    end
  end
~~~

## Takeaway

The project provided an introduction to Object-Oriented Programming (OOP) and the basics of Object-Oriented Design (OOD). We learnt how to approach OOD by using CRC (class-responsibility-collaboration) cards and how to develop test driven classes and modules.
