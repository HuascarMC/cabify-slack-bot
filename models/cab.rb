class Cab
  attr_accessor :state, :name, :location, :city

  def initialize(state, name, location, city)
      @state = state
      @name = name
      @location = location
      @city = city
  end

  def getCoords
   lat = self.location[lat].to_s
   lng = self.location[lng].to_s
   result = "#{lat}, #{lng}"
   return result
  end
end
