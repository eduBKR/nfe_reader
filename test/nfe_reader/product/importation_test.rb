require File.expand_path("../../../test_helper", __FILE__)

describe Nfe::Reader::Importation do
  def nfe_hash
    {
      importation: {
        nDI: '120373',
        dDI: '103846',
        xLocDesemb: 'Local',
        UFDesemb: 'ST',
        dDesemb: '01/01/2000',
        cExportador: '1312',
        tpViaTransp: '1',
        vAFRMM: '100.00',
        tpIntermedio: '1',
        CNPJ: '99819146000120',
        UFTerceiro: 'state',
        adi: {
          nAdicaonSeqAdic: '1',
          nSeqAdic: '1',
          cFabricante: '1357',
          vDescDI: '0.00'
        }
      }
    }
  end

  let(:importation) { Nfe::Reader::Importation.new(nfe_hash[:importation]) }

  it '#afrmm' do
    importation.afrmm.must_equal '100.00'
  end

  it '#transport' do
    importation.transport.must_equal '1'
  end

  it '#intermediate_kind' do
    importation.intermediate_kind.must_equal '1'
  end

  it '#cnpj' do
    importation.cnpj.must_equal '99819146000120'
  end

  it '#uf_customer' do
    importation.uf_customer.must_equal 'state'
  end

  it '#number' do
    importation.number.must_equal '120373'
  end

  it '#date' do
    importation.date.must_equal '103846'
  end

  it '#local' do
    importation.local.must_equal 'Local'
  end

  it '#state' do
    importation.state.must_equal 'ST'
  end

  it '#customs_clearance' do
    importation.customs_clearance.must_equal '01/01/2000'
  end

  it '#exporter' do
    importation.exporter.must_equal '1312'
  end

  it '#addition_number' do
    importation.addition_number.must_equal '1'
  end

  it '#addition_sequence' do
    importation.addition_sequence.must_equal '1'
  end

  it '#manufacturer' do
    importation.manufacturer.must_equal '1357'
  end

  it '#addition_descount' do
    importation.addition_descount.must_equal '0.00'
  end
end