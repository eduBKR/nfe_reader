require File.expand_path("../../test_helper", __FILE__)

describe Nfe::Total do
  def nfe_hash
    {
      total: {
        ICMSTot: {
          vBC: '1000.00',
          vICMS: '500.00',
          vBCST: '200.00',
          vST: '50.00',
          vProd: '750.00',
          vFrete: '10.00',
          vSeg: '45.00',
          vDesc: '12.00',
          vII: '0.00',
          vIPI: '12.00',
          vPIS: '4.00',
          vCOFINS: '16.00',
          vOutro: '15.99',
          vNF: '1250.00'
        },
        ISSQNtot: {
          vServ: '125.00',
          vBC: '100.00',
          vISS: '10.00',
          vPIS: '2.00',
          vCOFINS: '4.00'
        },
        retTrib:{
          vRetPIS: '1.00',
          vRetCOFINS: '2.00',
          vRetCSLL: '5.00',
          vBCIRRF: '10.00',
          vIRRF: '1.50',
          vBCRetPrev: '100.00',
          vRetPrev: '25.00'
        }
      }
    }
  end

  let(:total) { Nfe::Total.new(nfe_hash[:total]) }

  it '#icms_base' do
    total.icms_base.must_equal '1000.00'
  end

  it '#icms' do
    total.icms.must_equal '500.00'
  end

  it '#st_base' do
    total.st_base.must_equal '200.00'
  end

  it '#st' do
    total.st.must_equal '50.00'
  end

  it '#product' do
    total.product.must_equal '750.00'
  end

  it '#freight' do
    total.freight.must_equal '10.00'
  end

  it '#insurance' do
    total.insurance.must_equal '45.00'
  end

  it '#descount' do
    total.descount.must_equal '12.00'
  end

  it '#ii' do
    total.ii.must_equal '0.00'
  end

  it '#ipi' do
    total.ipi.must_equal '12.00'
  end

  it '#pis' do
    total.pis.must_equal '4.00'
  end

  it '#cofins' do
    total.cofins.must_equal '16.00'
  end

  it '#another' do
    total.another.must_equal '15.99'
  end

  it '#total' do
    total.total.must_equal '1250.00'
  end

  it '#service_value' do
    total.service_value.must_equal '125.00'
  end

  it '#service_base' do
    total.service_base.must_equal '100.00'
  end

  it '#service_iss' do
    total.service_iss.must_equal '10.00'
  end

  it '#service_pis' do
    total.service_pis.must_equal '2.00'
  end

  it '#service_cofins' do
    total.service_cofins.must_equal '4.00'
  end

  it '#retention_pis' do
    total.retention_pis.must_equal '1.00'
  end

  it '#retention_cofins' do
    total.retention_cofins.must_equal '2.00'
  end

  it '#retention_csll' do
    total.retention_csll.must_equal '5.00'
  end

  it '#retention_irrf_base' do
    total.retention_irrf_base.must_equal '10.00'
  end

  it '#retention_irrf' do
    total.retention_irrf.must_equal '1.50'
  end

  it '#retention_foresight_base' do
    total.retention_foresight_base.must_equal '100.00'
  end

  it '#retention_foresight' do
    total.retention_foresight.must_equal '25.00'
  end
end