module Bike_container

	def bike_count
		@bikes.count
	end

	def dock(bike)
		raise "is full" if full?
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

	def broken_bikes
		@bikes.select{|bike| bike.broken?}
	end

	def release_broken_bikes
		broken_bikes.map {|bike| @bikes.delete(bike) }
	end

	def drop_bikes_into(container)
		broken_bikes.each do |bike|
		  container.dock(bike)
		  @bikes.delete(bike)
		end
	end
end