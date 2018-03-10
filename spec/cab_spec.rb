require 'spec_helper'

 describe Cab do
     before do
      @cab = Cab.new('free', 'Land Rover', {"lon"=>1.2313, "lat"=>38.41 }, "Barcelona")
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
   expect("Barcelona").to include(@cab.city)
  end
end
