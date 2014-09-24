require File.expand_path("../../test_helper", __FILE__)

describe Nfe::Cane do
  def nfe_hash
    {
      cana: {
        safra: '2000',
        ref: '01/2000',
        qTotMes: '100000',
        qTotAnt: '90000',
        qTotGer: '110000',
        vFor: '5000',
        vTotDed: '2000',
        vLiqFor: '3000',
        
        forDia: [ 
            { dia: '01', qtde: '1000' },
            { dia: '10', qtde: '3000' }
        ],

        deduc: [
          { xDed: "Deduction 1", vDed: '10.00' },
          { xDed: "Deduction 2", vDed: '300.00' }
        ],

      }
    }
  end

  let(:cane) { Nfe::Cane.new(nfe_hash[:cana]) }

  it '#harvest' do
    cane.harvest.must_equal '2000'
  end

    it '#month' do
    cane.month.must_equal '01/2000'
  end

  it '#month_amount' do
    cane.month_amount.must_equal '100000'
  end

  it '#previous_amount' do
    cane.previous_amount.must_equal '90000'
  end

  it '#amount' do
    cane.amount.must_equal '110000'
  end

  it '#value' do
    cane.value.must_equal '5000'
  end

  it '#deduction_value' do
    cane.deduction_value.must_equal '2000'
  end

  it '#net_value' do
    cane.net_value.must_equal '3000'
  end

  it '#days' do
    cane.days.must_equal [['01', '1000'], ['10', '3000']]
  end

  it '#deductions' do
    cane.deductions.must_equal [['Deduction 1', '10.00'], ['Deduction 2', '300.00']]
  end
end