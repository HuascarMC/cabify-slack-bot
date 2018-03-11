class Cab
  attr_accessor :state, :name, :location, :city

  def initialize(state, name, location, city)
      @state = state
      @name = name
      @location = location
      @city = city
  end
end
