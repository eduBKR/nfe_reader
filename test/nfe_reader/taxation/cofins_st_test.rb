require File.expand_path("../../../test_helper", __FILE__)

describe Nfe::CofinsSt do
  def nfe_hash
    {
      COFINSST: {
        vBC: '100.00',
        pCOFINS: '17.00',
        vCOFINS: '17.00',
        qBCProd: '0',
        vAliqProd: '0'
      }
    }
  end

  let(:cofins) { Nfe::CofinsSt.new(nfe_hash[:COFINSST]) }

  it '#base' do
    cofins.base.must_equal '100.00'
  end

  it '#percentage' do
    cofins.percentage.must_equal '17.00'
  end

  it '#value' do
    cofins.value.must_equal '17.00'
  end

  it '#amount' do
    cofins.amount.must_equal '0'
  end

  it '#aliquot' do
    cofins.aliquot.must_equal '0'
  end
end