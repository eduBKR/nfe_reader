require File.expand_path("../../../test_helper", __FILE__)

describe Nfe::Reader::Vehicle do
  def nfe_hash
    {
      vehicle: {
        pOp: '1',
        chassi: '1234789',
        cCor: '1',
        xCor: 'Black',
        pot: '2.0',
        cilin: '500',
        pesoL: '2.700',
        pesoB: '4.000',
        nSerie: '1235',
        tpComb: '1',
        nMotor: '1351',
        tpComb: '1',
        CMT: '13221',
        dist: '2.3',
        anoMod: '2000',
        anoFab: '2000',
        tpPint: '1',
        tpVeic: '1',
        espVeic: '1',
        VIN: '123123',
        condVeic: '1',
        cMod: '1',
        cCorDEN: '1',
        lota: '5',
        tpRest: '0',
      }
    }
  end

  let(:vehicle) { Nfe::Reader::Vehicle.new(nfe_hash[:vehicle]) }

  it '#operation' do
    vehicle.operation.must_equal '1'
  end

  it '#chassi' do
    vehicle.chassi.must_equal '1234789'
  end

  it '#color' do
    vehicle.color.must_equal '1'
  end

  it '#color_name' do
    vehicle.color_name.must_equal 'Black'
  end

  it '#engine_power' do
    vehicle.engine_power.must_equal '2.0'
  end

  it '#engine_capacities' do
    vehicle.engine_capacities.must_equal '500'
  end

  it '#weight_net' do
    vehicle.weight_net.must_equal '2.700'
  end

  it '#weight_gross' do
    vehicle.weight_gross.must_equal '4.000'
  end

  it '#serie' do
    vehicle.serie.must_equal '1235'
  end

  it '#fuel_kind' do
    vehicle.fuel_kind.must_equal '1'
  end

  it '#engine_number' do
    vehicle.engine_number.must_equal '1351'
  end

  it '#cmt' do
    vehicle.cmt.must_equal '13221'
  end

  it '#wheelbase' do
    vehicle.wheelbase.must_equal '2.3'
  end

  it '#year' do
    vehicle.year.must_equal '2000'
  end

  it '#fabrication_year' do
    vehicle.fabrication_year.must_equal '2000'
  end

  it '#paint_kind' do
    vehicle.paint_kind.must_equal '1'
  end

  it '#kind' do
    vehicle.kind.must_equal '1'
  end

  it '#vehicle_kind' do
    vehicle.vehicle_kind.must_equal '1'
  end

  it '#vin' do
    vehicle.vin.must_equal '123123'
  end

  it '#condiction' do
    vehicle.condiction.must_equal '1'
  end

  it '#model' do
    vehicle.model.must_equal '1'
  end

  it '#color_code' do
    vehicle.color_code.must_equal '1'
  end

  it '#capacity' do
    vehicle.capacity.must_equal '5'
  end

  it '#restriction' do
    vehicle.restriction.must_equal '0'
  end
end