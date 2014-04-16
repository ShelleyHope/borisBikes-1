require 'garage'

describe "Garage" do

	let(:garage) {Garage.new(:capacity => 100)}
	let(:broken_bike) { double(:bike, broken?: true) }
	let (:working_bike) { double(:bike, broken?: false) }

	def fill_garage(garage)
		100.times {garage.dock(Bike.new)}
	end

	it 'has no bikes' do
	  expect(garage.bike_count).to eq 0
	end	

	it "should accept broken bikes" do
		garage.dock(broken_bike)
	  expect(garage.bike_count).to eq 1
	end

	it "should release fixed bikes" do
	  garage.dock(working_bike)
	  expect(garage.release(working_bike)).to eq working_bike
	end

	it "should repair a broken bike" do
		 expect(broken_bike).to receive(:fix!)
	  # 
	  #broken_bike.should_receive(:fix!).exactly(3).times
#expect(broken_bike).to receive(:feix!)
	  garage.repair(broken_bike)
	#  expect(broken_bike).to_be false 
	  # garage.repair(broken_bike)
	  # garage.repair(broken_bike)
	 #expect(broken_bike).to receive(:fix!)
#	broken_bike.should_receive(:fix!).exactly(3).times


	end

end