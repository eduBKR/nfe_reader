require File.expand_path("../../test_helper", __FILE__)

describe Nfe::Reader::Billing do
  def nfe_hash
    {
      billing: {
        fat:{
          nFat: '1000',
          vOrig: '1500.00',
          vDesc: '0.00',
          vLiq: '1500.00'
        },
        dup: {
            nDup: '1',
            dVenc: '01/01/2000',
            vDup: '1500.00' 
        }
      }
    }
  end

  def billing_hash
    {
      billing: {
        fat:{
          nFat: '1000',
          vOrig: '1500.00',
          vDesc: '0.00',
          vLiq: '1500.00'
        },
        dup: [
          {
            nDup: '1',
            dVenc: '01/01/2000',
            vDup: '750.00' 
          },
          {
            nDup: '2',
            dVenc: '01/01/2000',
            vDup: '750.00' 
          }
        ]
      }
    }
  end

  let(:billing) { Nfe::Reader::Billing.new(nfe_hash[:billing]) }

  describe 'One duplicate' do
    it '#number' do
      billing.number.must_equal '1000'
    end

    it '#value' do
      billing.value.must_equal '1500.00'
    end

    it '#descont' do
      billing.descont.must_equal '0.00'
    end

    it '#value_net' do
      billing.value_net.must_equal '1500.00'
    end

    it '#duplicates' do
      billing.duplicates.size.must_equal 1
    end
  end

  describe 'Two duplicate' do
      let(:billing) { Nfe::Reader::Billing.new(billing_hash[:billing]) }

    it '#duplicates' do
      billing.duplicates.size.must_equal 2
    end
  end
end