# In spec/docking_station_spec.rb
require 'docking_station'
require 'rspec/expectations' #Always include this to be able to use rspec/expectations (eg. expect{})

describe DockingStation do
#let(:bike) { double(:bike) }

  it "is a working bike" do #this check that it works with the 'Bike' class
#    allow(bike).to receive(:working?).and_return(true)
    bike = double(:working? => true)
    expect(bike.working?).to eq true #double needed
  end

  describe "#release_bike" do

    it {should respond_to(:release_bike)}

    it "raises an error when no bikes available" do
      expect{subject.release_bike}.to raise_error("No bikes left")
    end

    it "will only release a working bike" do
      bike1 = double(:bike) #working    #double needed
      bike2 = double(:bike) #broken     #double needed
      allow(bike1).to receive(:working?).and_return(true)
      allow(bike2).to receive(:working?).and_return(false)
      subject.dock(bike2)
      subject.dock(bike1)
      expect(subject.release_bike).to eq bike1
    end

    it "raises an error when all bikes are broken" do
     bike1 = double(:bike)              #double needed
     bike2 = double(:bike)              #double needed
     allow(bike1).to receive(:working?).and_return(false)
     allow(bike2).to receive(:working?).and_return(false)
     subject.dock(bike1)
     subject.dock(bike2)
     expect{subject.release_bike}.to raise_error("All bikes are broken")
    end
  end

  describe "#dock" do

    it {should respond_to(:dock).with(1).argument}

    it "docks a bike" do
      expect(subject.dock(bike)).to eq [bike]              #double needed
    end

    it "raises an error when capacity is full" do
      hoxton_station = DockingStation.new
      DockingStation::DEFAULT_CAPACITY.times do
        hoxton_station.dock(bike)              #double needed
      end
      expect{hoxton_station.dock(bike)}.to raise_error("No space left")              #double needed
    end
  end

  describe "#initialize" do

    it "capacity should start with 20" do
      holborn_station = DockingStation.new
      DockingStation::DEFAULT_CAPACITY.times do
        holborn_station.dock(bike)              #double needed
      end
      expect{holborn_station.dock(bike)}.to raise_error("No space left")              #double needed
    end

    it "user can set capacity at initialization" do
      ealing_station = DockingStation.new(30)
      30.times do
        ealing_station.dock(bike)              #double needed
      end
      expect{ealing_station.dock(bike)}.to raise_error("No space left")              #double needed
    end
  end
end






















