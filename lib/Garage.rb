require_relative "../lib/bike_container"

class Garage

	include Bike_container

	DEFAULT_CAPACITY = 1000

	def initialize(options={})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes =[]	
	end

	def repair(bike)
			bike.fix!
	end
end