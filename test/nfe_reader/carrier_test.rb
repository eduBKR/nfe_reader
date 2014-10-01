require File.expand_path("../../test_helper", __FILE__)

describe Nfe::Reader::Carrier do
  def nfe_hash
    {
      transp: {
        CNPJ: '99819146000120',
        xNome: 'Carrier',
        IE: '15786913',
        xEnder: 'Address',
        xMun: 'City',
        UF: 'ST'
      }
    }
  end

  let(:carrier) { Nfe::Reader::Carrier.new(nfe_hash[:transp]) }

  it '#cnpj' do
    carrier.cnpj.must_equal '99819146000120'
  end
  
  it '#cpf' do
    carrier.cpf.must_be_nil
  end

  it '#name' do
    carrier.name.must_equal 'Carrier'
  end

  it '#ie' do
    carrier.ie.must_equal '15786913'
  end

  it '#address' do
    carrier.address.must_equal 'Address'
  end

  it '#city' do
    carrier.city.must_equal 'City'
  end

  it '#state' do
    carrier.state.must_equal 'ST'
  end
end