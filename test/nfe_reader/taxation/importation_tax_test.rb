require File.expand_path("../../../test_helper", __FILE__)

describe NfeReader::ImportationTax do
  def nfe_hash
    {
      II: {
        vBC: '100.00',
        vDespAdu: '17.00',
        vII: '17.00',
        vIOF: '5.00'
      }
    }
  end

  let(:cofins) { NfeReader::ImportationTax.new(nfe_hash[:II]) }

  it '#base' do
    cofins.base.must_equal '100.00'
  end

  it '#expenditure' do
    cofins.expenditure.must_equal '17.00'
  end

  it '#taxes' do
    cofins.taxes.must_equal '17.00'
  end

  it '#iof' do
    cofins.iof.must_equal '5.00'
  end
end