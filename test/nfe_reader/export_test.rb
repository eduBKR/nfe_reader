require File.expand_path("../../test_helper", __FILE__)

describe Nfe::Reader::Export do
  def nfe_hash
    {
      exporta: {
        UFEmbarq: 'ST',
        xLocEmbarq: 'Address'
      }
    }
  end

  let(:export) { Nfe::Reader::Export.new(nfe_hash[:exporta]) }

  it '#state' do
    export.state.must_equal 'ST'
  end
  
  it '#address' do
    export.address.must_equal 'Address'
  end
end