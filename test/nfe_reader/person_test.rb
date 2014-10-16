require File.expand_path("../../test_helper", __FILE__)

describe Nfe::Reader::Person do
  def cte_hash
    {
      CNPJ: '58571647000153',
      CPF: '63123256952',
      IE: '1029384756',
      xNome: 'Person',
      xFant: 'Fantasy',
      fone: '55 5555-5555',
      email: 'email@localhost',
      UF: 'ST',
      RNTRC: '123812083',
      tpProp: '1'
    }
  end

  let(:person) { Nfe::Reader::Person.new(cte_hash) }

  it '#cnpj' do
    person.cnpj.must_equal cte_hash[:CNPJ]
  end

  it '#cpf' do
    person.cpf.must_equal cte_hash[:CPF]
  end

  it '#state_registration' do
    person.state_registration.must_equal cte_hash[:IE]
  end

  it '#name' do
    person.name.must_equal cte_hash[:xNome]
  end

  it '#fantasy' do
    person.fantasy.must_equal cte_hash[:xFant]
  end

  it '#phone' do
    person.phone.must_equal cte_hash[:fone]
  end

  it '#email' do
    person.email.must_equal cte_hash[:email]
  end

  it '#state' do
    person.state.must_equal cte_hash[:UF]
  end

  it '#rntrc' do
    person.rntrc.must_equal cte_hash[:RNTRC]
  end

  it '#owner_kind' do
    person.owner_kind.must_equal cte_hash[:tpProp]
  end
end