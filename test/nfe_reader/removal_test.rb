require File.expand_path("../../test_helper", __FILE__)

describe NfeReader::Removal do
  def nfe_hash
    {
      retirada: {
        CNPJ: '99819146000120',
        CPF: '64046757655',
        xLgr: 'Street',
        nro: '157',
        xCpl: 'Address',
        xBairro: 'Neighborhood',
        xMun: 'City',
        cMun: '1234',
        UF: 'ST',
      }
    }
  end

  let(:removal) { NfeReader::Removal.new(nfe_hash[:retirada]) }

  it '#cnpj' do
    removal.cnpj.must_equal '99819146000120'
  end
  
  it '#cpf' do
    removal.cpf.must_equal '64046757655'
  end

  it '#address' do
    removal.address.must_equal 'Street'
  end

  it '#number' do
    removal.number.must_equal '157'
  end

  it '#complement' do
    removal.complement.must_equal 'Address'
  end

  it '#neighborhood' do
    removal.neighborhood.must_equal 'Neighborhood'
  end

  it '#city_code' do
    removal.city_code.must_equal '1234'
  end

  it '#city' do
    removal.city.must_equal 'City'
  end

  it '#state' do
    removal.state.must_equal 'ST'
  end
end