require File.expand_path("../../../test_helper", __FILE__)

describe Nfe::Reader::Duplicate do
  def nfe_hash
    {
      duplicate: {
        nDup: '1',
        dVenc: '01/01/2000',
        vDup: '50.00'
      }
    }
  end

  let(:duplicate) { Nfe::Reader::Duplicate.new(nfe_hash[:duplicate]) }

  it '#number' do
    duplicate.number.must_equal '1'
  end

  it '#expiration' do
    duplicate.expiration.must_equal '01/01/2000'
  end

  it '#value' do
    duplicate.value.must_equal '50.00'
  end
end
