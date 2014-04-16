require_relative '../lib/van'

describe Van do
	let(:van) {Van.new(:capacity => 10)}
	let(:broken_bike) { double(:bike, broken?: true) }
	let (:working_bike) { double(:bike, broken?: false) }

	def fill_van(van)
		10.times {van.dock(Bike.new)}
	end

	it 'has no bikes' do
	  expect(van.bike_count).to eq 0
	end

	it "should accept a bike" do
	  van.dock(broken_bike)
	  expect(van.bike_count).to eq 1
	end

	it "should release a bike" do
	  van.dock(working_bike)
	  expect(van.release(working_bike)).to eq working_bike
	end

	it "should know when it is full" do
	  fill_van(van)
    expect(lambda{van.dock(working_bike)}).to raise_error(RuntimeError)
	end

	it 'knows about its broken bikes' do
		van.dock(broken_bike)
		expect(van.broken_bikes).to eq [broken_bike]
	end

 	it "releases broken bikes" do
  	van.dock(broken_bike) 
  	expect(van.release_broken_bikes).to eq [broken_bike]
  end

  it 'drops the broken bikes into the garage' do
  	garage = double :garage
  	van.dock(broken_bike)
  	
     expect(garage).to receive(:dock).with(broken_bike)
  	van.drop_bikes_into(garage)
  end

end
