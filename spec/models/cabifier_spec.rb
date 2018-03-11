require 'spec_helper'

VCR.eject_cassette
VCR.turn_off!
WebMock.disable!

 describe Cabifier do
     before do
      @cabifier = Cabifier.new
     end

  subject { app }


  it 'gets all cabs from Cabifys API' do
   expect('').to eq(@cabifier.getCabs())
  end

  it 'fails to get all cabs from Cabifys API' do
   expect('').to eq(@cabifier.getCabs())
  end

  it 'hires nearest cab' do
   expect('').to eq(@cabifier.cabify())
  end

  it 'fails to hire nearest cab' do
   expect('').to eq(@cabifier.cabify())
  end
end
