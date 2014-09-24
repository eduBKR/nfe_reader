require File.expand_path("../../test_helper", __FILE__)

describe Nfe::Provider do
  def provider_hash
    {
      emit: {
        CNPJ: '99819146000120',
        CPF: '64046757655',
        xNome: 'Provider',
        xFant: 'Provider',
        IE: '15786913',
        IEST: '975940113',
        IM: '3856749',
        CRT: '1',
        CNAE: '123456',
        enderEmit: {
          fone: '55 5555-5555',
          xLgr: 'Green Street',
          nro: '123',
          xCpl: '',
          xBairro: 'Neighborhood',
          cMun: '1246',
          xMun: 'City',
          UF: 'ST',
          CEP: '00000-000',
          cPais: '1058',
          xPais: 'Brazil'
        }
      }
    }
  end

  describe 'with address' do
    let(:provider) { Nfe::Provider.new(provider_hash[:emit]) }

    it '#cnpj' do
      provider.cnpj.must_equal '99819146000120'
    end

    it '#cpf' do
      provider.cpf.must_equal '64046757655'
    end

    it '#name' do
      provider.name.must_equal 'Provider'
    end

    it '#fantasia' do
      provider.fantasy.must_equal 'Provider'
    end

    it '#state_registration' do
      provider.state_registration.must_equal '15786913'
    end

    it '#state_registration_st' do
      provider.state_registration_st.must_equal '975940113'
    end

    it '#city_registration' do
      provider.city_registration.must_equal '3856749'
    end

    it '#regime' do
      provider.regime.must_equal '1'
    end

    it '#cnae' do
      provider.cnae.must_equal '123456'
    end

    it '#phone' do
      provider.phone.must_equal '55 5555-5555'
    end

    it '#number' do
      provider.number.must_equal '123'
    end

    it '#complement' do
      provider.complement.must_equal ''
    end

    it '#address' do
      provider.address.must_equal 'Green Street'
    end

    it '#neighborhood' do
      provider.neighborhood.must_equal 'Neighborhood'
    end

    it '#city_code' do
      provider.city_code.must_equal '1246'
    end

    it '#city' do
      provider.city.must_equal 'City'
    end

    it '#state' do
      provider.state.must_equal 'ST'
    end

    it '#country_code' do
      provider.country_code.must_equal '1058'
    end

    it '#country' do
      provider.country.must_equal 'Brazil'
    end

    it '#zip_code' do
      provider.zip_code.must_equal '00000-000'
    end
  end

  describe 'without address' do
    let(:provider) { Nfe::Provider.new }

    it '#phone' do
      provider.number.must_be_nil
    end

    it '#number' do
      provider.number.must_be_nil
    end

    it '#address' do
      provider.address.must_be_nil
    end
    it '#neighborhood' do
      provider.neighborhood.must_be_nil
    end

    it '#city_code' do
      provider.city_code.must_be_nil
    end

    it '#city' do
      provider.city.must_be_nil
    end

    it '#state' do
      provider.state.must_be_nil
    end

    it '#country_code' do
      provider.country_code.must_be_nil
    end

    it '#country' do
      provider.country.must_be_nil
    end
  end
end