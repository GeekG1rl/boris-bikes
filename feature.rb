

require_relative './lib/docking_station.rb'
require_relative './lib/bike.rb'

stn = DockingStation.new
bike = Bike.new
stn.dock bike

# As a person,
# So that I can use a bike,
# I'd like a docking station to release a bike.
released_bike = stn.release_bike
raise "bike is not a Bike" unless released_bike.class == Bike

# As a person,
# So that I can use a good bike,
# I'd like to see if a bike is working

raise "bike is not working" unless released_bike.working?

# As a member of the public
# So I can return bikes I've hired
# I want to dock my bike at the docking station

bike2 = Bike.new
stn_2 = DockingStation.new

raise "#dock does not return list of docked bikes" unless stn_2.dock(bike2) == [bike2]

# As a member of the public
# So I can decide whether to use the docking station
# I want to see a bike that has been docked

raise "#bike does not return the docked bike" unless stn_2.bikes == [bike2]

# As a member of the public,
# So that I am not confused and charged unnecessarily,
# I'd like docking stations not to release bikes when there are none available.

raise "dock returns a different bike to the docked bike" unless stn_2.release_bike == bike2

empty_stn = DockingStation.new

# raise "station releases a bike when it is empty" if stn.release_bike.class == Bike

# As a maintainer of the system,
# So that I can control the distribution of bikes,
# I'd like docking stations not to accept more bikes than their capacity.

bike3 = Bike.new
# raise "can dock a bike at a full station" if stn.dock bike3 == bike3

# As a system maintainer,
# So that I can plan the distribution of bikes,
# I want a docking station to have a default capacity of 20 bikes.

20.times {empty_stn.dock Bike.new}
raise "cant hold more than one bike." unless empty_stn.bikes.count > 1

# empty_stn.dock Bike.new
# raise "can hold more than 20 bikes" if empty_stn.bikes.count > 20

# As a system maintainer,
# So that busy areas can be served more effectively,
# I want to be able to specify a larger capacity when necessary.

# stn_default_capacity = DockingStation.new
# raise "default capacity is not 20" unless stn_default_capacity.capacity == 20

# stn_manual_capacity = DockingStation.new(30)
# raise "default capacity can't be manually changed" unless stn_manual_capacity.capacity == 30

# As a member of the public,
# So that I reduce the chance of getting a broken bike in future,
# I'd like to report a bike as broken when I return it.

empty_stn = DockingStation.new
bike4 = Bike.new
bike4.report_broken
bike4.working?
empty_stn.dock(bike4)

# As a maintainer of the system,
# So that I can manage broken bikes and not disappoint users,
# I'd like docking stations not to release broken bikes.

empty_stn = DockingStation.new
bike5 = Bike.new
bike5.report_broken
empty_stn.dock(bike5)
raise "shouldn't release broken bike" unless empty_stn.release_bike != bike5

































