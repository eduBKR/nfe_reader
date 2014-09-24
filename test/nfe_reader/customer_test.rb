require File.expand_path("../../test_helper", __FILE__)

describe Nfe::Customer do
  def customer_hash
    {
      dest: {
        CNPJ: '99819146000120',
        CPF: '64046757655',
        xNome: 'Customer',
        IE: '15786913',
        email: 'customer@test.mail',
        ISUF: '1234567890',
        idEstrangeiro: '10021312198423',
        enderDest: {
          fone: '55 5555-5555',
          xLgr: 'Green Street',
          nro: '123',
          xBairro: 'Neighborhood',
          cMun: '1246',
          xMun: 'City',
          UF: 'ST',
          cPais: '1058',
          xPais: 'Brazil'
        }
      }
    }
  end

  describe 'with address' do
    let(:customer) { Nfe::Customer.new(customer_hash[:dest]) }

    it '#foreign_code' do
      customer.foreign_code.must_equal '10021312198423'
    end

    it '#cnpj' do
      customer.cnpj.must_equal '99819146000120'
    end
    
    it '#cpf' do
      customer.cpf.must_equal '64046757655'
    end

    it '#name' do
      customer.name.must_equal 'Customer'
    end

    it '#state_registration' do
      customer.state_registration.must_equal '15786913'
    end

    it '#email' do
      customer.email.must_equal 'customer@test.mail'
    end

    it '#suframa' do
      customer.suframa.must_equal '1234567890'
    end

    it '#phone' do
      customer.phone.must_equal '55 5555-5555'
    end

    it '#number' do
      customer.number.must_equal '123'
    end

    it '#address' do
      customer.address.must_equal 'Green Street'
    end
    it '#neighborhood' do
      customer.neighborhood.must_equal 'Neighborhood'
    end

    it '#city_code' do
      customer.city_code.must_equal '1246'
    end

    it '#city' do
      customer.city.must_equal 'City'
    end

    it '#state' do
      customer.state.must_equal 'ST'
    end

    it '#country_code' do
      customer.country_code.must_equal '1058'
    end

    it '#country' do
      customer.country.must_equal 'Brazil'
    end
  end

  describe 'without address' do
    let(:customer) { Nfe::Customer.new }
    it '#phone' do
      customer.number.must_be_nil
    end

    it '#number' do
      customer.number.must_be_nil
    end

    it '#address' do
      customer.address.must_be_nil
    end
    it '#neighborhood' do
      customer.neighborhood.must_be_nil
    end

    it '#city_code' do
      customer.city_code.must_be_nil
    end

    it '#city' do
      customer.city.must_be_nil
    end

    it '#state' do
      customer.state.must_be_nil
    end

    it '#country_code' do
      customer.country_code.must_be_nil
    end

    it '#country' do
      customer.country.must_be_nil
    end
  end
end