module Bike_container
	
	def initialize(options = {})
		@bikes=[]
	end

	def bike_count
		@bikes.count
	end

	def dock(bike)
		@bikes << bike
	end

	def release(bike)
		@bikes.delete(bike)		
	end	

end