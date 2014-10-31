require File.expand_path("../../../test_helper", __FILE__)

describe NfeReader::Pis do
  def nfe_hash
    {
      pis: {
        CST: '10',
        vBC: '100.00',
        pPIS: '17.00',
        vPIS: '17.00',
        qBCProd: '0',
        vAliqProd: '0'
      }
    }
  end

  let(:pis) { NfeReader::Pis.new(nfe_hash) }

  it '#cst' do
    pis.cst.must_equal '10'
  end

  it '#base' do
    pis.base.must_equal '100.00'
  end

  it '#percentage' do
    pis.percentage.must_equal '17.00'
  end

  it '#value' do
    pis.value.must_equal '17.00'
  end

  it '#amount' do
    pis.amount.must_equal '0'
  end

  it '#aliquot' do
    pis.aliquot.must_equal '0'
  end
end