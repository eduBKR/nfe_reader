require File.expand_path("../../../test_helper", __FILE__)

describe Nfe::Reader::Fuel do
  def nfe_hash
    {
      fuel: {
        cProdANP: '10613541',
        CODIF: '123456',
        qTemp: '1700.00',
        CIDE: {
          qBCprod: '2000.00',
          vAliqProd: '12.00',
          vCIDE: '240.00',
        }
      }
    }
  end

  let(:fuel) { Nfe::Reader::Fuel.new(nfe_hash[:fuel]) }

  it '#anp' do
    fuel.anp.must_equal '10613541'
  end

  it '#codif' do
    fuel.codif.must_equal '123456'
  end

  it '#amount' do
    fuel.amount.must_equal '1700.00'
  end

  it '#cide_base' do
    fuel.cide_base.must_equal '2000.00'
  end

  it '#cide_aliquot' do
    fuel.cide_aliquot.must_equal '12.00'
  end

  it '#cide_value' do
    fuel.cide_value.must_equal '240.00'
  end
end