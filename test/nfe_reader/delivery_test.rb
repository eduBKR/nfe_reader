require File.expand_path("../../test_helper", __FILE__)

describe NfeReader::Delivery do
  def nfe_hash
    {
      entrega: {
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

  let(:delivery) { NfeReader::Delivery.new(nfe_hash[:entrega]) }

  it '#cnpj' do
    delivery.cnpj.must_equal '99819146000120'
  end
  
  it '#cpf' do
    delivery.cpf.must_equal '64046757655'
  end

  it '#address' do
    delivery.address.must_equal 'Street'
  end

  it '#number' do
    delivery.number.must_equal '157'
  end

  it '#complement' do
    delivery.complement.must_equal 'Address'
  end

  it '#neighborhood' do
    delivery.neighborhood.must_equal 'Neighborhood'
  end

  it '#city_code' do
    delivery.city_code.must_equal '1234'
  end

  it '#city' do
    delivery.city.must_equal 'City'
  end

  it '#state' do
    delivery.state.must_equal 'ST'
  end
end