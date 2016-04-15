require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def dock(bike)
    raise "No space left" if full?
    @bikes << bike
  end

  def release_bike
    raise "No bikes left" if empty?
    raise "Bike is broken" if @bikes.last.working? == false
    @bikes.pop
    #use apprendice injection (for next step)
  end

  private

  def full?
    bikes.count >= @capacity
  end

  def empty?
    bikes.count == 0
  end
end
