require 'spec_helper'

VCR.eject_cassette
VCR.turn_off!
WebMock.disable!

 describe Geocoder do
     before do
      @geocoder = Geocoder.new
     end

  subject { app }


  it 'has an API key' do
   expect(@geocoder.api_key).to be_truthy
  end

  it 'geocodes address' do
   expect('40.4489254,-3.6708406').to eq(@geocoder.geocode("Calle de Pradillo, 42, 28002 Madrid, Spain"))
  end
  #

  it 'gets city for address' do
   expect('Comunidad de Madrid').to  eq(@geocoder.city("Plaza de la Puerta del Sol, s/n, 28013"))
  end

  it 'fails to get city for address' do
   expect('Failure').to  eq(@geocoder.city(23))
  end
  xit 'geocode gem works' do
   expect('-34.05744,151.15219').to eq(@geocoder.send(:geocode, "Cronulla, NSW"))
  end
end
