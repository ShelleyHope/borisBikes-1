require_relative "../lib/bike_container"



class Van
	
  include Bike_container

  DEFAULT_CAPACITY = 10

  def initialize(options = {})
	@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
	@bikes=[]
  end
end