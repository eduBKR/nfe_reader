require File.expand_path("../../test_helper", __FILE__)

describe NfeReader::Protocol do
  def nfe_hash
    {
      infProt: {
        tpAmb: '1',
        verAplic: 'SVRS2000101120000',
        chNFe: '12300384950081649000148500001000001310002342',
        dhRecbto: '2000-01-01T12:00:00',
        nProt: '100000481241129',
        digVal: 'aklOQ0184NjoeaqCIRT01927Crf',
        cStat: '100',
        xMotivo: 'Autorizado o uso da NF-e'
      }
    }
  end

  let(:protocol) { NfeReader::Protocol.new(nfe_hash) }

  it '#enviroment' do
    protocol.enviroment.must_equal '1'
  end

  it '#version_app' do
    protocol.version_app.must_equal 'SVRS2000101120000'
  end

  it '#key' do
    protocol.key.must_equal '12300384950081649000148500001000001310002342'
  end

  it '#date' do
    protocol.date.must_equal '2000-01-01T12:00:00'
  end

  it '#number' do
    protocol.number.must_equal '100000481241129'
  end

  it '#digest' do
    protocol.digest.must_equal 'aklOQ0184NjoeaqCIRT01927Crf'
  end

  it '#status' do
    protocol.status.must_equal '100'
  end

  it '#description' do
    protocol.description.must_equal 'Autorizado o uso da NF-e'
  end
end