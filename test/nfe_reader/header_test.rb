require File.expand_path("../../test_helper", __FILE__)

describe Nfe::Reader::Header do
  def nfe_hash
    {
      ide: {
        cUF: 'ST',
        cMunFG: '1342',
        cNF: '00000',
        natOp: '1234',
        nNF: '1000',
        mod: '55',
        dEmi: '01/01/2000',
        tpEmis: '1',
        dSaiEnt: '02/01/2000',
        hSaiEnt: '15:30',
        dhEmi: '02/02/2000',
        serie: '1',
        tpNF: '1',
        tpAmb: '2',
        finNFe: '1',
        verProc: '0.0.1',
        indPag: '9',
        procEmi: '0',
        cDV: '1',
        tpImp: '1',
        idDest: '1',
        indPres: '1',
        indFinal: '0',
      }
    }
  end

  let(:header) { Nfe::Reader::Header.new(nfe_hash[:ide]) }

  it '#final_consumer' do
    header.final_consumer.must_equal '0'
  end

  it '#consumer_presence' do
    header.consumer_presence.must_equal '1'
  end

  it '#contingency_date' do
    header.contingency_date.must_be_nil
  end

  it '#contingency_justification' do
    header.contingency_justification.must_be_nil
  end

  it '#destiny_code' do
    header.destiny_code.must_equal '1'
  end

  it '#state' do
    header.state.must_equal 'ST'
  end

  it '#city' do
    header.city.must_equal '1342'
  end

  it '#sample_number' do
    header.sample_number.must_equal '00000'
  end

  it '#operation' do
    header.operation.must_equal '1234'
  end

  it '#number' do
    header.number.must_equal '1000'
  end

  it '#model' do
    header.model.must_equal '55'
  end

  it '#emission' do
    header.emission.must_equal '01/01/2000'
  end

  it '#emission_kind' do
    header.emission_kind.must_equal '1'
  end

  it '#emission_date' do
    header.emission_date.must_equal '02/02/2000'
  end

  it '#out' do
    header.out.must_equal '02/01/2000'
  end

  it '#out_time' do
    header.out_time.must_equal '15:30'
  end

  it '#serie' do
    header.serie.must_equal '1'
  end

  it '#kind' do
    header.kind.must_equal '1'
  end

  it '#environment' do
    header.environment.must_equal '2'
  end

  it '#finality' do
    header.finality.must_equal '1'
  end

  it '#version' do
    header.version.must_equal '0.0.1'
  end

  it '#payment' do
    header.payment.must_equal '9'
  end

  it '#process' do
    header.process.must_equal '0'
  end

  it '#digit' do
    header.digit.must_equal '1'
  end

  it '#orientation' do
    header.orientation.must_equal '1'
  end
end