require 'bike'

describe Bike do
  it {is_expected.to respond_to(:working?)}

	describe "#report_broken" do

	  it {is_expected.to respond_to(:report_broken)}

    it "allows a user to report a broken bike" do
      bike = Bike.new
      bike.report_broken
      expect(bike.working?).to eq false
    end

	end

end
