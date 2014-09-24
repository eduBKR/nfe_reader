require File.expand_path("../../../test_helper", __FILE__)

describe Nfe::Issqn do
  def nfe_hash
    {
      issqn: {
        vBC: '100.00',
        vISSQN: '17.00',
        cMunFG: '1467',
        cListServ: '0',
        vAliq: '17.00',
        cSitTrib: '10',
      }
    }
  end

  let(:issqn) { Nfe::Issqn.new(nfe_hash[:issqn]) }

  it '#cst' do
    issqn.cst.must_equal '10'
  end

  it '#base' do
    issqn.base.must_equal '100.00'
  end

  it '#aliquot' do
    issqn.aliquot.must_equal '17.00'
  end

  it '#value' do
    issqn.value.must_equal '17.00'
  end

  it '#city' do
    issqn.city.must_equal '1467'
  end

  it '#services' do
    issqn.services.must_equal '0'
  end
end