require_relative "../lib/bike_container"

class DockingStation
	include Bike_container
	
	DEFAULT_CAPACITY = 10
	def initialize(options={})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes =[]	
	end

	def rent
		raise " is empty" if bike_count == 0
		working_bike = available_bikes.first
		release(working_bike)
		working_bike
	end

	
end