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
   expect([40.4489254, -3.6708406 ]).to eq(@geocoder.send(:geocode, "Calle de Pradillo, 42, 28002 Madrid, Spain"))
  end

  it 'geocodes different address' do
   expect([55.9476897, -3.1884344]).to eq(@geocoder.send(:geocode,  "Chambers St, Edinburgh EH1 1JF"))
  end
end
