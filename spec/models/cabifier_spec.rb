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
   cabs = @cabifier.getCabs()
   expect(4).to eq(cabs.size)
  end

  it 'gets cabs in Barcelona from Cabifys API' do
   cabs = @cabifier.getCabsInCity('Barcelona')
   expect(1).to eq(cabs.size)
  end

  it 'gets cabs in Madrid from Cabifys API' do
   cabs = @cabifier.getCabsInCity('Madrid')
   expect(3).to eq(cabs.size)
  end

  # it 'fails to get all cabs from Cabifys API' do
  #  cabs = @cabifier.getCabs()
  #  expect(0).to eq(cabs.size)
  # end

  it 'hires nearest cab' do
   expect('Success').to eq(@cabifier.cabify('Plaza Mayor, Madrid'))
  end
  #
  # it 'fails to hire nearest cab' do
  #  expect('').to eq(@cabifier.cabify())
  # end

  it 'calculates nearest cab given a location' do
   cabs = @cabifier.getCabs
   cab = cabs.select{ |c| c.name == 'Hyundai' }
   destination = '40.4489254,-3.6708406'
   expect(cab[0]).to eq(@cabifier.calculateNearestCab(cabs, destination))
  end

  it 'calculate nearest cab given a different location' do
   cabs = @cabifier.getCabs
   cab = cabs.select{ |c| c.name == 'Opel' }
   destination = '37.129665,-8.669586'
   expect(cab[0]).to eq(@cabifier.calculateNearestCab(cabs, destination))
  end
end
