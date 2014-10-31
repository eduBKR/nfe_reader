require File.expand_path("../../test_helper", __FILE__)

describe NfeReader::Product do
  def product_hash
    {
      product: {
        nItem: '1',
        prod: {
          cProd: '0001',
          xProd: 'Product',
          cEAN: '789101312121',
          NCM: '10.10.10.00',
          CFOP: '1111',
          uCom: 'UN',
          qCom: '2',
          vUnCom: '10',
          vProd: '20',
          cEANTrib: '789101312122',
          uTrib: 'UN',
          qTrib: '2',
          vUnTrib: '20',
          indTot: '1',
          EXTIPI: '00',
          vFrete: '0.00',
          vSeg: '2.00',
          vDesc: '0.00',
          vOutro: '4.00',
          xPed: '1001',
          nItemPed: '23'
        },
        imposto: {}
      }
    }
  end

  let(:product) { NfeReader::Product.new(product_hash[:product]) }

  it '#demand_item' do
    product.demand_item.must_equal '23'
  end

  it '#demand_number' do
    product.demand_number.must_equal '1001'
  end

  it '#number' do
    product.number.must_equal '1'
  end

  it '#code' do
    product.code.must_equal '0001'
  end

  it '#name' do
    product.name.must_equal 'Product'
  end

  it '#ean' do
    product.ean.must_equal '789101312121'
  end

  it '#ncm' do
    product.ncm.must_equal '10.10.10.00'
  end

  it '#cfop' do
    product.cfop.must_equal '1111'
  end

  it '#unit_sale' do
    product.unit_sale.must_equal 'UN'
  end

  it '#amount_sale' do
    product.amount_sale.must_equal '2'
  end

  it '#value_sale' do
    product.value_sale.must_equal '10'
  end

  it '#total' do
    product.total.must_equal '20'
  end

  it '#gtin' do
    product.gtin.must_equal '789101312122'
  end

  it '#unit' do
    product.unit.must_equal 'UN'
  end

  it '#amount' do
    product.amount.must_equal '2'
  end

  it '#value' do
    product.value.must_equal '20'
  end

  it '#kind' do
    product.kind.must_equal '1'
  end

  it '#ipi_exception' do
    product.ipi_exception.must_equal '00'
  end

  it '#freight' do
    product.freight.must_equal '0.00'
  end

  it '#insurance' do
    product.insurance.must_equal '2.00'
  end

  it '#discount' do
    product.discount.must_equal '0.00'
  end

  it '#other_value' do
    product.other_value.must_equal '4.00'
  end
end