class DockingStation

	DEFAULT_CAPACITY = 10
	def initialize(options={})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes =[]	
	end

	def bike_count
		@bikes.count
	end

	def dock(bike)
		raise "Station is full" if full?
		@bikes << bike
	end

	def full?
		@capacity==bike_count
	end

end