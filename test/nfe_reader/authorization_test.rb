require File.expand_path("../../test_helper", __FILE__)

describe Nfe::Reader::Authorization do
  def nfe_hash
    {
      autXML: {
        CNPJ: '99819146000120',
        CPF: '64046757655'
      }
    }
  end

  let(:authorization) { Nfe::Reader::Authorization.new(nfe_hash[:autXML]) }

  it '#cnpj' do
    authorization.cnpj.must_equal '99819146000120'
  end
  
  it '#cpf' do
    authorization.cpf.must_equal '64046757655'
  end
end