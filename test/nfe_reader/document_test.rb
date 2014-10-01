require File.expand_path("../../test_helper", __FILE__)

describe Nfe::Reader::Document do
  def nfe_hash
    {
      NFref: {
        refNFe: '1000000000000',
        refCTe: '2000000000000',
        refNF: {
          cUF: 'State',
          AAMM: '0010',
          CNPJ: '99819146000120',
          mod: '1',
          serie: '1',
          nNF: '1000'
        },
        refNFP: {
          cUF: 'State',
          AAMM: '0110',
          CNPJ: '99819146000121',
          CPF: '64046757655',
          IE: '10010101010',
          mod: '2',
          serie: '2',
          nNF: '1001',
        },
        refECF: {
          mod: '2A',
          nECF: '1000',
          nCOO: '30471'
        }
      }
    }
  end

  let(:document) { Nfe::Reader::Document.new(nfe_hash[:NFref]) }

  it '#key' do
    document.key.must_equal '1000000000000'
  end

  it '#nfe_state' do
    document.nfe_state.must_equal 'State'
  end

  it '#nfe_year' do
    document.nfe_year.must_equal '0010'
  end

  it '#nfe_cnpj' do
    document.nfe_cnpj.must_equal '99819146000120'
  end

  it '#nfe_model' do
    document.nfe_model.must_equal '1'
  end

  it '#nfe_serie' do
    document.nfe_serie.must_equal '1'
  end

  it '#nfe_number' do
    document.nfe_number.must_equal '1000'
  end

  it '#farmer_state' do
    document.farmer_state.must_equal 'State'
  end

  it '#farmer_year' do
    document.farmer_year.must_equal '0110'
  end

  it '#farmer_cnpj' do
    document.farmer_cnpj.must_equal '99819146000121'
  end

  it '#farmer_cpf' do
    document.farmer_cpf.must_equal '64046757655'
  end

  it '#farmer_ie' do
    document.farmer_ie.must_equal '10010101010'
  end

  it '#farmer_model' do
    document.farmer_model.must_equal '2'
  end

  it '#farmer_serie' do
    document.farmer_serie.must_equal '2'
  end

  it '#farmer_number' do
    document.farmer_number.must_equal '1001'
  end

  it '#cte_key' do
    document.cte_key.must_equal '2000000000000'
  end

  it '#ecf_model' do
    document.ecf_model.must_equal '2A'
  end

  it '#ecf_number' do
    document.ecf_number.must_equal '1000'
  end

  it '#ecf_operation' do
    document.ecf_operation.must_equal '30471'
  end
end