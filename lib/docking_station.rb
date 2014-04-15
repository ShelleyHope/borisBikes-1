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

	def available_bikes
		@bikes.reject{|bike| bike.broken?}
	end

	def release(bike)
		@bikes.delete(bike) if !@bikes.empty?
	end

	def rent
		raise "Station is empty" if bike_count == 0
		working_bike = available_bikes.first
		release(working_bike)
		working_bike
	end

	def relinquish
			broken_bike = @bikes.select{ |bike| bike.broken? }.first
			release(broken_bike)
			broken_bike
	end
end