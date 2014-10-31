require File.expand_path("../../test_helper", __FILE__)

describe NfeReader::Provider do
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

  let(:provider) { NfeReader::Provider.new(provider_hash[:emit]) }

    it '#person' do
      provider.person.must_be_instance_of NfeReader::Person
    end

    it '#address' do
      provider.address.must_be_instance_of NfeReader::Address
    end
end