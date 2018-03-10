require 'spec_helper'

 describe Geocoder do
     before do
      @geocoder = Geocoder.new
     end

  subject { app }


  it 'has an API key' do
   expect(@geocoder.api_key).to be_truthy
  end

  it 'geocodes address' do
   VCR.eject_cassette
   VCR.turn_off!
   WebMock.disable!
   expect([40.4489254, -3.6708406 ]).to eq(@geocoder.send(:geocode, "Calle de Pradillo, 42, 28002 Madrid, Spain"))
  end

  it 'has a city' do
   expect("Barcelona").to include(@cab.city)
  end
end
