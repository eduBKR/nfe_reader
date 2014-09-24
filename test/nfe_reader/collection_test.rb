require File.expand_path("../../test_helper", __FILE__)

describe Nfe::Collection do
  def nfe_hash
    {
      collection: {
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

  def collection_hash
    {
      collection: {
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

  let(:collection) { Nfe::Collection.new(nfe_hash[:collection]) }

  describe 'One duplicate' do
    it '#number' do
      collection.number.must_equal '1000'
    end

    it '#value' do
      collection.value.must_equal '1500.00'
    end

    it '#descont' do
      collection.descont.must_equal '0.00'
    end

    it '#value_net' do
      collection.value_net.must_equal '1500.00'
    end

    it '#duplicates' do
      collection.duplicates.size.must_equal 1
    end
  end

  describe 'Two duplicate' do
      let(:collection) { Nfe::Collection.new(collection_hash[:collection]) }

    it '#duplicates' do
      collection.duplicates.size.must_equal 2
    end
  end
end