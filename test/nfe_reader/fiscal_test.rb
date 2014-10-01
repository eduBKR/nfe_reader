require File.expand_path("../../test_helper", __FILE__)

describe Nfe::Reader::Fiscal do
  def nfe_hash
    {
      avulsa: {
        CNPJ: '99819146000120',
        xOrgao: 'Agency',
        matr: '183601271298',
        xAgente: 'Agent',
        fone: '55 5555 5555',
        UF: 'State',
        nDAR: '1000',
        dEmi: '01-01-2000',
        vDAR: '100.00',
        repEmi: '1',
        dPag: '02-01-2000'
      }
    }
  end

  let(:fiscal) { Nfe::Reader::Fiscal.new(nfe_hash[:avulsa]) }

  it '#cnpj' do
    fiscal.cnpj.must_equal '99819146000120'
  end

  it '#agency' do
    fiscal.agency.must_equal 'Agency'
  end

  it '#code' do
    fiscal.code.must_equal '183601271298'
  end

  it '#name' do
    fiscal.name.must_equal 'Agent'
  end

  it '#phone' do
    fiscal.phone.must_equal '55 5555 5555'
  end

  it '#state' do
    fiscal.state.must_equal 'State'
  end

  it '#number' do
    fiscal.number.must_equal '1000'
  end

  it '#date' do
    fiscal.date.must_equal '01-01-2000'
  end

  it '#value' do
    fiscal.value.must_equal '100.00'
  end

  it '#repartition' do
    fiscal.repartition.must_equal '1'
  end

  it '#paid_date' do
    fiscal.paid_date.must_equal '02-01-2000'
  end
end