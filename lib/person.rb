# class Person
# 	def has_bike?
# 		!@bike.nil?
# 	end

# 	def rent_bike_from(station)
# 		@bike = station.release_bike
# 	end

# end

class Person

  def has_bike?
  	!@bike.nil?
  end

  def rent_bike_from(station)
    @bike = station.release_bike	
  	
  end
end