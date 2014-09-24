require File.expand_path("../../../test_helper", __FILE__)

describe Nfe::Medicament do
  def nfe_hash
    {
      medicament: {
        nLote: '123980',
        qLote: '12',
        dFab: '01/01/2000',
        dVal: '01/01/2004',
        vPMC: '289.00'
      }
    }
  end

  let(:medicament) { Nfe::Medicament.new(nfe_hash[:medicament]) }

  it '#lot_number' do
    medicament.lot_number.must_equal '123980'
  end

  it '#lot_amount' do
    medicament.lot_amount.must_equal '12'
  end

  it '#fabrication' do
    medicament.fabrication.must_equal '01/01/2000'
  end

  it '#validity' do
    medicament.validity.must_equal '01/01/2004'
  end

  it '#ceiling_price' do
    medicament.ceiling_price.must_equal '289.00'
  end
end