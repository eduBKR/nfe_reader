require File.expand_path("../../test_helper", __FILE__)

describe NfeReader::Information do
  def nfe_hash
    {
      infAdic: {
        infAdFisco: 'Information',
        infCpl: 'Taxpayer Information',

        obsCont: [
          { xCampo: '1', xTexto: 'One' },
          { xCampo: '2', xTexto: 'Two' }
        ],

        obsFisco: [
          { xCampo: '1', xTexto: 'One' },
          { xCampo: '2', xTexto: 'Two' }
        ],

        procRef: [
          { nProc: '789792342134363', indProc: '1' },
          { nProc: '212343146458121', indProc: '1' }
        ]
      }
    }
  end

  let(:information) { NfeReader::Information.new(nfe_hash[:infAdic]) }

  it '#information' do
    information.information.must_equal 'Information'
  end
  
  it '#information_taxpayer' do
    information.information_taxpayer.must_equal 'Taxpayer Information'
  end
end