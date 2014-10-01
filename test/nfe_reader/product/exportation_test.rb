require File.expand_path("../../../test_helper", __FILE__)

describe Nfe::Reader::Exportation do
  def nfe_hash
    {
      detExport: {
        nDraw: '1',
        exportInd: {
          nRE: '5001',
          chNFe: '1000',
          qExport: '10'
        }
      }
    }
  end

  let(:exportation) { Nfe::Reader::Exportation.new(nfe_hash[:detExport]) }

  it '#drawnback' do
    exportation.drawnback.must_equal '1'
  end

  it '#number' do
    exportation.number.must_equal '5001'
  end

  it '#key' do
    exportation.key.must_equal '1000'
  end

  it '#amount' do
    exportation.amount.must_equal '10'
  end
end