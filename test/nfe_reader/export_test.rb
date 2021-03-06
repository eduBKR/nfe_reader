require File.expand_path("../../test_helper", __FILE__)

describe NfeReader::Export do
  def nfe_hash
    {
      exporta: {
        UFEmbarq: 'ST',
        xLocEmbarq: 'Address'
      }
    }
  end

  let(:export) { NfeReader::Export.new(nfe_hash[:exporta]) }

  it '#state' do
    export.state.must_equal 'ST'
  end
  
  it '#address' do
    export.address.must_equal 'Address'
  end
end