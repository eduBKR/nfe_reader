require File.expand_path("../../test_helper", __FILE__)

describe NfeReader::Customer do
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

  let(:customer) { NfeReader::Customer.new(customer_hash[:dest]) }

  it '#person' do
    customer.person.must_be_instance_of NfeReader::Person
  end

  it '#address' do
    customer.address.must_be_instance_of NfeReader::Address
  end
end