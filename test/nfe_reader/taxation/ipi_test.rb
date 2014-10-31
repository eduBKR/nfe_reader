require File.expand_path("../../../test_helper", __FILE__)

describe NfeReader::Ipi do
  def nfe_hash
    {
      ipi: {
        clEnq: '0',
        cEnq: '0',
        CNPJProd: '99819146000120',
        cSelo: '0',
        qSelo: '0',
        
        IPITrib: {
          CST: '20',
          vBC: '100.00',
          qUnid: '0.00',
          vUnid: '0.00',
          pIPI: '15.00',
          vIPI: '15.00',
        },
        
        IPINT:{
          CST: '10'
        }
      }
    }
  end

  let(:ipi) { NfeReader::Ipi.new(nfe_hash[:ipi]) }

  it '#frame_class' do
    ipi.frame_class.must_equal '0'
  end

  it '#frame_code' do
    ipi.frame_code.must_equal '0'
  end

  it '#cnpj' do
    ipi.cnpj.must_equal '99819146000120'
  end

  it '#seal' do
    ipi.seal.must_equal '0'
  end

  it '#seal_amount' do
    ipi.seal_amount.must_equal '0'
  end

  it '#cst' do
    ipi.cst.must_equal '20'
  end

  it '#ipi_base' do
    ipi.ipi_base.must_equal '100.00'
  end

  it '#amount' do
    ipi.amount.must_equal '0.00'
  end

  it '#value_unit' do
    ipi.value_unit.must_equal '0.00'
  end

  it '#percentage' do
    ipi.percentage.must_equal '15.00'
  end

  it '#value' do
    ipi.value.must_equal '15.00'
  end

  it '#cst_group' do
    ipi.cst_group.must_equal '10'
  end
end