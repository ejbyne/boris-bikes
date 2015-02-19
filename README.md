[![Code Climate](https://codeclimate.com/github/ejbyne/boris-bikes/badges/gpa.svg)](https://codeclimate.com/github/ejbyne/boris-bikes)
[![Test Coverage](https://codeclimate.com/github/ejbyne/boris-bikes/badges/coverage.svg)](https://codeclimate.com/github/ejbyne/boris-bikes)

# Boris Bikes

## Summary

This was our Week 1 project at Makers Academy.

The task was to create a simple system for managing the London "Boris Bikes" system in Ruby.

The project provided an introduction to Object Oriented Programming (OOP) and the basics of Object Oriented Design (OOD). We learnt how to approach OOD by using CRC (class-responsibility-collaboration) cards and how to develop test driven classes and modules.

## Technologies used

- Ruby
- Rspec

## Completed tasks

- The system must keep track of a number of docking stations and the bikes.
- It must allow a user to rent the bikes and return them.
- Occasionally the bikes will break and then they will be unavailable for rental.
- There must also be a garage to fix the bikes and a van to move the bikes between the stations and the garage.

## Instructions

Clone the repo on your machine:
```
$ git clone https://github.com/ejbyne/boris-bikes.git
```

Change into the directory and run the tests:
```
$ cd boris-bikes
$ rspec
```

## Favourite Code Snippet

Method for transferring bikes between vans/docking stations etc:
```ruby
  def transfer_to(other_container, selected_bikes)
    selected_bikes.reverse_each do |bike|
      self.release(bike) if other_container.dock(bike) 
    end
  end
```
