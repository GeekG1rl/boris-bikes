require 'bike'

describe Bike do
  it {is_expected.to respond_to(:working?)}

	describe "#report_broken" do
	    #"allows a user to report a broken bike"
	  it {is_expected.to respond_to(:report_broken)}
	end
	
end
