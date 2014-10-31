require File.expand_path("../../test_helper", __FILE__)

describe NfeReader::Address do
  def cte_hash
    {
      CNPJ: '58571647000153',
      CPF: '28113502254',
      fone: '55 5555-5555',
      xLgr: 'Address',
      nro: 'Number',
      xCpl: 'Complement',
      xBairro: 'Neighborhood',
      cMun: '1001',
      xMun: 'City',
      CEP: '00000-000',
      UF: 'State',
      cPais: '1058',
      xPais: 'Brazil'
    }
  end

  let(:address) { NfeReader::Address.new(cte_hash) }

  it '#cnpj' do
    address.cnpj.must_equal cte_hash[:CNPJ]
  end

  it '#cpf' do
    address.cpf.must_equal cte_hash[:CPF]
  end

  it '#phone' do
    address.phone.must_equal cte_hash[:fone]
  end

  it '#address' do
    address.address.must_equal cte_hash[:xLgr]
  end

  it '#number' do
    address.number.must_equal cte_hash[:nro]
  end

  it '#complement' do
    address.complement.must_equal cte_hash[:xCpl]
  end

  it '#neighborhood' do
    address.neighborhood.must_equal cte_hash[:xBairro]
  end

  it '#city_code' do
    address.city_code.must_equal cte_hash[:cMun]
  end

  it '#city' do
    address.city.must_equal cte_hash[:xMun]
  end

  it '#zip_code' do
    address.zip_code.must_equal cte_hash[:CEP]
  end

  it '#state' do
    address.state.must_equal cte_hash[:UF]
  end

  it '#country_code' do
    address.country_code.must_equal cte_hash[:cPais]
  end

  it '#country' do
    address.country.must_equal cte_hash[:xPais]
  end
end