require 'spec_helper'

 describe Cab do
     before do
      @cab = Cab.new('free', 'Land Rover', {"lon"=>1.2313, "lat"=>38.41 }, "Mediterranean sea")
     end

  subject { app }

  it 'has a state' do
   expect('free').to include(@cab.state)
  end

  it 'has a name' do
   expect('Land Rover').to include(@cab.name)
  end

  it 'has a location' do
   expect({"lon"=>1.2313, "lat"=>38.41 }).to include(@cab.location)
  end

  it 'has a city' do
   expect("Mediterranean sea").to include(@cab.city)
  end

  it 'gives cabs coordinates' do
   expect('38.41,1.2313').to include(@cab.getCoords)
  end
end
