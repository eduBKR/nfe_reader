require File.expand_path("../../../test_helper", __FILE__)

describe Nfe::Reader::Icms do
  def nfe_hash
    {
      ICMS: {
        orig: '1',
        CST: '10',
        pICMS: '10',
        vICMS: '100',
        modBC: '1',
        vBC: '1000',
        pRedBC: '0',
        modBCST: '0',
        pRedBCST: '0',
        pMVAST: '0',
        vBCST: '0',
        pICMSST: '0',
        vICMSST: '0',
        vBCSTRet: '0',
        vICMSSTRet: '0',
        vBCSTDest: '0',
        vICMSSTDes: '0',
        UFST: 'ST',
        motDesICMS: '0',
        pCredSN: '0',
        vCredICMSSN: '0',
        CSOSN: '0',
      }
    }
  end

  let(:icms) { Nfe::Reader::Icms.new(nfe_hash[:ICMS]) }

  it '#origin' do
    icms.origin.must_equal '1'
  end

  it '#cst' do
    icms.cst.must_equal '10'
  end

  it '#icms_percentage' do
    icms.icms_percentage.must_equal '10'
  end

  it '#icms' do
    icms.icms.must_equal '100'
  end

  it '#icms_base_kind' do
    icms.icms_base_kind.must_equal '1'
  end

  it '#icms_base' do
    icms.icms_base.must_equal '1000'
  end

  it '#icms_base_reductionicms_base_reduction' do
    icms.icms_base_reduction.must_equal '0'
  end

  it '#icms_st_base_kind' do
    icms.icms_st_base_kind.must_equal '0'
  end

  it '#icms_st_base_reduction' do
    icms.icms_st_base_reduction.must_equal '0'
  end

  it '#mva' do
    icms.mva.must_equal '0'
  end

  it '#icms_st_base' do
    icms.icms_st_base.must_equal '0'
  end

  it '#icms_st_percentage' do
    icms.icms_st_percentage.must_equal '0'
  end

  it '#icms_st' do
    icms.icms_st.must_equal '0'
  end

  it '#icms_st_base_retained_sender' do
    icms.icms_st_base_retained_sender.must_equal '0'
  end

  it '#icms_st_retained_sender' do
    icms.icms_st_retained_sender.must_equal '0'
  end

  it '#icms_st_base_retained' do
    icms.icms_st_base_retained.must_equal '0'
  end

  it '#icms_st_retained' do
    icms.icms_st_retained.must_equal '0'
  end

  it '#state' do
    icms.state.must_equal 'ST'
  end

  it '#retained_reason' do
    icms.retained_reason.must_equal '0'
  end

  it '#credit_percentage' do
    icms.credit_percentage.must_equal '0'
  end

  it '#icms_credit' do
    icms.icms_credit.must_equal '0'
  end

  it '#sn_operation_code' do
    icms.sn_operation_code.must_equal '0'
  end
end