require 'spec_helper'

VCR.eject_cassette
VCR.turn_off!
WebMock.disable!

 describe DistanceMatrix do
     before do
      @distanceMatrix = DistanceMatrix.new
     end

  subject { app }

  it 'calculates distance between two coordinates' do
   expect('6.3 mi').to eq(@distanceMatrix.calculateDistance('40.4153,-3.6845', '40.4489254,-3.6708406'))
  end

  it 'calculates duration of travel between two coordiantes' do
   expect('21 mins').to eq(@distanceMatrix.calculateDuration('40.4153,-3.6845', '40.4489254,-3.6708406'))
  end

  it 'calculates and returns both distance and duration in array' do
   expect(['6.3 mi', '21 mins']).to eq(@distanceMatrix.calculateDistanceAndDuration('40.4153,-3.6845', '40.4489254,-3.6708406'))
  end

end
