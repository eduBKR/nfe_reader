require File.expand_path("../../test_helper", __FILE__)

describe NfeReader::Lot do

  let(:file) { File.open(File.expand_path("../../files/sample-lot.xml", __FILE__))}
  let (:lot) { NfeReader::Base.read(File.open(file)) }

  it '#version' do
    lot.version.must_equal '2.00'
  end

  it '#lot_version' do
    lot.lot_version.must_equal '2.00'
  end

  it '#number' do
    lot.number.must_equal '1000'
  end

  it '#nfes' do
    lot.nfes.first.must_be_instance_of NfeReader::Nfe
  end

  it '#protocol' do
    lot.protocol.must_be_instance_of NfeReader::Protocol
  end
end