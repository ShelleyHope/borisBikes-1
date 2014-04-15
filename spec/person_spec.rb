require 'person'

describe Person do
	let(:person) {Person.new}
	it 'has no bike' do
		expect(person).not_to have_bike
	end

	it 'can rent a bike from a docking station' do
		station = double :station
		expect(station).to receive(:release_bike)

		person.rent_bike_from(station)
	end

	it 'has a bike after renting one' do
		station = double :station, release_bike: :bike
		person.rent_bike_from(station)
		expect(person).to have_bike
	end

	# it "can return a bike" do
	#   staion = dou
	# end
end
