require File.expand_path("../../../test_helper", __FILE__)

describe Nfe::Reader::Armament do
  def nfe_hash
    {
      armament: {
        tpArma: '1',
        nSerie: '12345-678',
        nCano: '0.5',
        descr: 'Gun'
      }
    }
  end

  let(:armament) { Nfe::Reader::Armament.new(nfe_hash[:armament]) }

  it '#kind' do
    armament.kind.must_equal '1'
  end

  it '#serie' do
    armament.serie.must_equal '12345-678'
  end

  it '#barrel' do
    armament.barrel.must_equal '0.5'
  end

  it '#description' do
    armament.description.must_equal 'Gun'
  end
end