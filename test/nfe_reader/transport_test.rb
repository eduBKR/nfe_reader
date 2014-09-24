require File.expand_path("../../test_helper", __FILE__)

describe Nfe::Transport do
  def transport_hash
    {
      transport: {
        modFrete: '1',
        
        retTransp: {
          vServ: '1000.00',
          vBCRet: '1000.00',
          pICMSRet: '12.00',
          vICMSRet: '120.00',
          CFOP: '1111',
          cMunFG: '1356'
        },

        veicTransp:{
          placa: 'BBB-1210',
          UF: 'UF',
          RNTC: '1129853'
        },

        reboque: {
          placa: 'AAA-1210',
          UF: 'ST',
          RNTC: '139754'
        },

        vagao: '0010',
        balsa: '1000',
       
        vol: {
          qVol: '1',
          esp: '1',
          marca: '1',
          nVol: '1',
          pesoL: '100',
          pesoB: '130',
          lacres: {
            nLacre: '1234567890'
          }
        },

        transporta: {
          CNPJ: '99819146000120',
          xNome: 'Carrier',
          IE: '15786913',
          xEnder: 'Address',
          xMun: 'City',
          UF: 'ST'
        }
      }
    }
  end

  def seals_hash
    {
      transport: {
        vol: {
          lacres: [
            { nLacre: '1234567890' },
            { nLacre: '1239126304' },
            { nLacre: '1231313123' }
          ]
        },
      }
    }
  end

  let(:transport) { Nfe::Transport.new(transport_hash[:transport]) }

  it '#kind' do
    transport.kind.must_equal '1'
  end

  it '#service_value' do
    transport.service_value.must_equal '1000.00'
  end

  it '#base' do
    transport.base.must_equal '1000.00'
  end

  it '#icms_aliquot' do
    transport.icms_aliquot.must_equal '12.00'
  end

  it '#icms_value' do
    transport.icms_value.must_equal '120.00'
  end

  it '#cfop' do
    transport.cfop.must_equal '1111'
  end

  it '#city' do
    transport.city.must_equal '1356'
  end

  it '#vehicle_plaque' do
    transport.vehicle_plaque.must_equal 'BBB-1210'
  end

  it '#vehicle_state' do
    transport.vehicle_state.must_equal 'UF'
  end

  it '#vehicle_rntc' do
    transport.vehicle_rntc.must_equal '1129853'
  end

  it '#hauling_palque' do
    transport.hauling_palque.must_equal 'AAA-1210'
  end

  it '#hauling_state' do
    transport.hauling_state.must_equal 'ST'
  end

  it '#hauling_rntc' do
    transport.hauling_rntc.must_equal '139754'
  end

  it '#wagon' do
    transport.wagon.must_equal '0010'
  end

  it '#ferry' do
    transport.ferry.must_equal '1000'
  end

  it '#volume_amount' do
    transport.volume_amount.must_equal '1'
  end

  it '#volume_kind' do
    transport.volume_kind.must_equal '1'
  end

  it '#volume_brand' do
    transport.volume_brand.must_equal '1'
  end

  it '#volume_number' do
    transport.volume_number.must_equal '1'
  end

  it '#weight_net' do
    transport.weight_net.must_equal '100'
  end

  it '#weight_gross' do
    transport.weight_gross.must_equal '130'
  end

  it '#seals' do
    transport.seals.must_equal  '1234567890'
  end

  it '#carrier' do
    transport.carrier.wont_be_nil
  end

  describe 'seals' do
    let(:transport) { Nfe::Transport.new(seals_hash[:transport]) }
  
    it 'have a string with all seal' do
         transport.seals.must_equal '1234567890, 1239126304, 1231313123'
    end
  end
end