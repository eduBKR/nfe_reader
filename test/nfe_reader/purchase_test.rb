require File.expand_path("../../test_helper", __FILE__)

describe Nfe::Purchase do
  def nfe_hash
    {
      compra: {
        xNEmp: '10001',
        xPed: '12356',
        xCont: '1257521'
      }
    }
  end

  let(:purchase) { Nfe::Purchase.new(nfe_hash[:compra]) }

  it '#number' do
    purchase.number.must_equal '10001'
  end
  
  it '#demand' do
    purchase.demand.must_equal '12356'
  end

  it '#contract' do
    purchase.contract.must_equal '1257521'
  end
end